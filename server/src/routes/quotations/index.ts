import express, { Request, Response, NextFunction } from 'express';
import { dateToUnix, unixToDate } from "../../middlewares/timeConvert";
import { verifyForwarderToken } from "../../middlewares/verifyToken";
import quotationRepository from "../../repository/QuotationRepository";
import goodsRepository from "../../repository/GoodsRepository";
import Quotation from "../../domain/Quotation";
import forwarderRepository from "../../repository/ForwarderRepository";
import requestRepository from "../../repository/RequestRepository";
import printLog from "../../middlewares/printLog";
import QuotationController from "../../controller/QuotationController";


const router = express.Router();

const quotationController: QuotationController = new QuotationController();
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
router.get('/', verifyForwarderToken , quotationController.getQuotation);

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
router.post('/', verifyForwarderToken, quotationController.registerQuote);

export default router;