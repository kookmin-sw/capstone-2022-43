import express, { Request, Response, NextFunction } from 'express';
import { dateToUnix, unixToDate } from "../../middlewares/timeConvert";
import { verifyForwarderToken } from "../../middlewares/verifyToken";
import quotationRepository from "../../repository/QuotationRepository";
import goodsRepository from "../../repository/GoodsRepository";
import Quotation from "../../domain/Quotation";
import forwarderRepository from "../../repository/ForwarderRepository";
import requestRepository from "../../repository/RequestRepository";
import printLog from "../../middlewares/printLog";


const router = express.Router();

/**
 * @swagger
 * /api/quotations:
 *   get:
 *     tags: [/api/quotations]
 *     summary: Respond quotation, that are matched with user token
 *     security:
 *     - ForwarderToken: []
 *     responses:
 *       200:
 *         description: Success to find quotation
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 200
 *                 message:
 *                   type: string
 *                   example: Success to find quotation
 *                 Quotation:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Quotation'
 *                     - type: object
 *                       properties:
 *                         forwarder:
 *                           $ref: '#/components/schemas/Forwarder'
 *                         requests:
 *                           $ref: '#/components/schemas/Request'
 *                 selectedGoods:
 *                   type: array
 *                   example: []
 */
router.get('/', verifyForwarderToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;

        const quotations = await quotationRepository.createQueryBuilder('Q')
        .leftJoinAndSelect('Q.forwarder', 'F')
        .leftJoinAndSelect('Q.requests', 'R')
        .select(['Q.id', 'Q.ocean_freight_price', 'Q.inland_freight_price', 'Q.total_price', 'Q.estimated_time', 'Q.created_at',
            'F.name', 'F.phone_number', 'F.corporation_name', 'F.corporation_number',
            'R.id', 'R.trade_type', 'R.trade_detail', 'R.forwarding_date', 'R.departure_country', 'R.departure_detail',
            'R.destination_country', 'R.destination_detail', 'R.incoterms', 'R.closing_date', 'R.created_at'])
        .where('Q.forwarder_uuid = :uuid', { uuid })
        .getMany();

        quotations.forEach((quotation) => {
            dateToUnix(quotation, ['estimated_time', 'created_at']);
            dateToUnix(quotation!.requests, ['forwarding_date', 'closing_date', 'created_at']);
        });

        res.status(200).json({
            status: 200,
            message: 'Success to find quotation',
            Quotation: quotations,
            selectedGoods: []
        });
        return printLog(req, res);
    }
    catch (error){
        return next(error);
    }
});

/**
 * @swagger
 * /api/quotations:
 *   post:
 *     tags: [/api/quotations]
 *     summary: Create instances to QUOTATION table, After then respond forwarder information, request and goods data
 *     security:
 *     - ForwarderToken: []
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *             - ocean_right_price
 *             - inland_freight_price
 *             - total_price
 *             - estimated_time
 *             - request_id
 *             properties:
 *               ocean_right_price:
 *                 type: number
 *                 example: 1234
 *               inland_freight_price:
 *                 type: number
 *                 example: 1234
 *               total_price:
 *                 type: number
 *                 example: 1234
 *               estimated_time:
 *                 type: number
 *                 example: your_data (unix time)
 *               request_id:
 *                 type: number
 *                 example: 1
 *     responses:
 *       200:
 *         description: Success to insert quotation
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 200
 *                 message:
 *                   type: string
 *                   example: Success to insert quotation
 *                 Quotation:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Quotation'
 *                     - type: object
 *                       properties:
 *                         forwarder:
 *                           $ref: '#/components/schemas/Forwarder'
 *                         requests:
 *                           $ref: '#/components/schemas/Request'
 *                 selectedGoods:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Goods'
 */
router.post('/', verifyForwarderToken, async (req: Request, res: Response, next: NextFunction) => {
    try {
        const uuid = req.decoded.uuid;

        const reqQuotation = req.body as Quotation;
        reqQuotation.forwarder_uuid = uuid;
        unixToDate(reqQuotation, ["estimated_time"]);

        const quotation = await quotationRepository.save(reqQuotation);

        const [ forwarder, request ] = await Promise.all([
            forwarderRepository.findOne({
                select: ['name', 'phone_number', 'corporation_name', 'corporation_number'],
                where: { uuid }
            }),
            requestRepository.findOne({
                select: ['id', 'trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                    'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at'],
                where: { id: quotation.request_id }
            })
        ]);

        const selected_goods_array = await goodsRepository.find({
            select: ['id', 'name', 'price', 'weight', 'standard_unit', 'hscode', 'created_at'],
            where: { request_id: request!.id }
        });

        selected_goods_array.forEach((goods) => {
            dateToUnix(goods, ['created_at']);
        });
        dateToUnix(request, ['forwarding_date', 'closing_date', 'created_at']);
        dateToUnix(quotation, ['estimated_time', 'created_at']);

        delete quotation.request_id;
        delete quotation.forwarder_uuid;

        quotation.forwarder = forwarder!;
        quotation.requests = request!;

        res.status(200).json({
            status: 200,
            message: 'Success to insert quotation',
            Quotation: [quotation],
            selectedGoods: selected_goods_array
        });
        return printLog(req, res);
    } catch (error) {
        return next(error);
    }
});

export default router;