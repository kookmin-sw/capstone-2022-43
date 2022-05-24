import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix } from "../../middlewares/timeConvert";
import requestRepository from "../../repository/RequestRepository";
import goodsRepository from "../../repository/GoodsRepository";
import quotationRepository from "../../repository/QuotationRepository";
import printLog from "../../middlewares/printLog";


const router = express.Router();

/**
 * @swagger
 * /api/requests/{id}:
 *   get:
 *     tags: [/api/requests]
 *     summary: Respond matched quote request and goods data with parameter {ID}
 *     security:
 *     - OwnerToken: []
 *     parameters:
 *     - name: id
 *       in: path
 *       description: id to find request
 *       required: true
 *       type: number
 *     responses:
 *       200:
 *         description: Success to find request
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
 *                   example: Success to find request
 *                 selectedRequest:
 *                   $ref: '#/components/schemas/Request'
 *                 selectedGoods:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Goods'
 */
router.get('/:id', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) =>{
    try {
        const request_id = Number(req.params.id);

        const selected_request = await requestRepository.findOne({
            select: ['trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at'],
            where: { id: request_id }
        });
        dateToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);

        const selected_goods_array = await goodsRepository.find({
            select: ['id', 'name', 'price', 'weight', 'standard_unit', 'hscode', 'created_at'],
            where: { request_id }
        });

        selected_goods_array.forEach((goods) => {
            dateToUnix(goods, ["created_at"]);
        });

        res.status(200).json({
            status: 200,
            message: 'Success to find request',
            selectedRequest: selected_request,
            selectedGoods: selected_goods_array
        });
        return printLog(req, res);
    }
    catch (error) {
        return next(error);
    }
});

/**
 * @swagger
 * /api/requests/{id}/quotations:
 *   get:
 *     tags: [/api/requests]
 *     summary: Respond matched forwarder quotations with parameter {ID}
 *     security:
 *     - OwnerToken: []
 *     parameters:
 *     - name: id
 *       in: path
 *       description: id to find quotations about request
 *       required: true
 *       type: number
 *     responses:
 *       200:
 *         description: Success to find quotations
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
 *                   example: Success to find quotations
 *                 Quotation:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Quotation'
 *                 selectedGoods:
 *                   type: array
 *                   example: []
 */
router.get('/:id/quotations', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const request_id = Number(req.params.id);

        const quotations = await quotationRepository.createQueryBuilder('Q')
        .leftJoinAndSelect('Q.forwarder', 'F')
        .leftJoinAndSelect('Q.requests', 'R')
        .select(['Q.id', 'Q.ocean_freight_price', 'Q.inland_freight_price', 'Q.total_price', 'Q.estimated_time', 'Q.created_at',
            'F.name', 'F.phone_number', 'F.corporation_name', 'F.corporation_number',
            'R.id', 'R.trade_type', 'R.trade_detail', 'R.forwarding_date', 'R.departure_country', 'R.departure_detail',
            'R.destination_country', 'R.destination_detail', 'R.incoterms', 'R.closing_date', 'R.created_at'])
        .where('Q.request_id = :id', { id: request_id })
        .getMany();

        quotations.forEach((quotation) => {
            dateToUnix(quotation, ['estimated_time', 'created_at']);
            dateToUnix(quotation.requests, ['forwarding_date', 'closing_date', 'created_at']);
        });

        res.status(200).json({
            status: 200,
            message: 'Success to find quotations',
            Quotation: quotations,
            selectedGoods: []
        });
        return printLog(req, res);
    } catch (error) {
        return next(error)
    }
});

export default router;