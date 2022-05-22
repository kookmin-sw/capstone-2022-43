import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix, unixToDate } from "../../middlewares/timeConvert";
import QuoteRequest from '../../domain/Request';
import Goods from "../../domain/Goods";
import requestRepository from "../../repository/RequestRepository";
import goodsRepository from "../../repository/GoodsRepository";
import printLog from "../../middlewares/printLog";


const router = express.Router();


/**
 * @swagger
 * /api/requests:
 *   get:
 *     tags: [/api/requests]
 *     summary: Respond quote requests, that are matched with user token
 *     security:
 *     - OwnerToken: []
 *     responses:
 *       200:
 *         description: Success to find requests
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
 *                   example: Success to find requests
 *                 selectedRequests:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Request'
 */
router.get('/', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;

        const selected_requests = await requestRepository.find({
            select: ['id', 'trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at'],
            where: { owner_uuid: uuid }
        });

        selected_requests.forEach((request) => {
            dateToUnix(request, ['forwarding_date', 'closing_date', 'created_at']);
        });

        res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequests: selected_requests
        });
        return printLog(req, res);
    }
    catch (error){
        return next(error);
    }
});

/**
 * @swagger
 * /api/requests:
 *   post:
 *     tags: [/api/requests]
 *     summary: Create instances to REQUESTS and GOODS table, After then respond created quote request and goods data
 *     security:
 *     - OwnerToken: []
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *             - trade_type
 *             - trade_detail
 *             - forwarding_date
 *             - departure_country
 *             - departure_detail
 *             - destination_country
 *             - destination_detail
 *             - incoterms
 *             - closing_date
 *             properties:
 *               trade_type:
 *                 type: string
 *                 example: your_request
 *               trade_detail:
 *                 type: string
 *                 example: your_request
 *               forwarding_date:
 *                 type: number
 *                 example: your_request (unix time)
 *               departure_country:
 *                 type: string
 *                 example: your_request
 *               departure_detail:
 *                 type: string
 *                 example: your_request
 *               destination_country:
 *                 type: string
 *                 example: your_request
 *               destination_detail:
 *                 type: string
 *                 example: your_request
 *               incoterms:
 *                 type: string
 *                 example: your_request
 *               closing_date:
 *                 type: number
 *                 example: your_request (unix time)
 *     responses:
 *       200:
 *         description: Success to quote_request
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
 *                   example: Success to quote_request
 *                 createdRequest:
 *                   $ref: '#/components/schemas/Request'
 *                 createdGoods:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Goods'
 */
router.post('/', verifyOwnerToken, async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;
        const quote_request = req.body.quoteRequest as QuoteRequest;
        const goods_array = req.body.goodsRequests as Goods[];

        const insertRequest = async () => {
            quote_request.owner_uuid = uuid;
            unixToDate(quote_request, ["forwarding_date", "closing_date"]);
            return requestRepository.save(quote_request);
        };

        const created_request = await insertRequest();
        dateToUnix(created_request, ["forwarding_date", "closing_date", "created_at"]);

        const created_goods_array = await Promise.all(
             goods_array.map(async (goods: Goods) => {
                 goods.request_id = created_request.id!;
                const created_goods = await goodsRepository.save(goods);
                dateToUnix(created_goods, ["created_at"]);
                return created_goods;
            })
        );

        res.status(200).json({
            status: 200,
            message: 'Success to quote_request',
            createdRequest: created_request,
            createdGoods: created_goods_array
        });
        return printLog(req, res);
    }
    catch (error){
        return next(error);
    }
});

export default router;