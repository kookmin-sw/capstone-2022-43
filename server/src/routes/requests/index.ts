import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix, unixToDate } from "../../middlewares/timeConvert";
import QuoteRequest from '../../domain/Request';
import Goods from "../../domain/Goods";
import requestRepository from "../../repository/RequestRepository";
import goodsRepository from "../../repository/GoodsRepository";
import printLog from "../../middlewares/printLog";
import RequestController from "../../controller/RequestController";
import requestService from "../../service/RequestService";


const router = express.Router();
const requestController: RequestController = new RequestController();

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
router.get('/', verifyOwnerToken, requestController.getRequests);

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
router.post('/', verifyOwnerToken, requestController.registerRequest);

export default router;