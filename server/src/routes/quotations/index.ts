import express, { Request, Response, NextFunction } from 'express';
import { verifyForwarderToken } from "../../middlewares/verifyToken";
import QuotationController from "../../controller/QuotationController";


const router = express.Router();

const quotationController: QuotationController = new QuotationController();
/**
 * @swagger
 * /api/quotations:
 *   get:
 *     tags: [/api/quotations]
 *     summary: Respond quotation, that are matched with users token
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
 *                 message:
 *                   type: string
 *                   example: Success to find quotation
 *                 result:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Quotation'
 */
router.get('/', verifyForwarderToken , quotationController.getQuotation);

/**
 * @swagger
 * /api/quotations:
 *   post:
 *     tags: [/api/quotations]
 *     summary: Create instances to QUOTATION table
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
 *                 type: datetime
 *                 example: 2000-01-01 00:00:00
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
 *                 message:
 *                   type: string
 *                   example: Success to insert quotation
 *                 result:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Quotation'
 */
router.post('/', verifyForwarderToken, quotationController.registerQuote);

export default router;