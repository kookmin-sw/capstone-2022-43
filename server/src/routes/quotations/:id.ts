import express, { Request, Response, NextFunction } from 'express';
import { verifyAnyToken } from "../../middlewares/verifyToken";
import QuotationController from "../../controller/QuotationController";


const router = express.Router();
const quotationController: QuotationController = new QuotationController();
/**
 * @swagger
 * /api/quotations/{id}:
 *   get:
 *     tags: [/api/quotations]
 *     summary: Respond matched quotation data
 *     security:
 *     - OwnerToken: []
 *     - ForwarderToken: []
 *     parameters:
 *     - name: id
 *       in: path
 *       description: id to find quotation
 *       required: true
 *       type: number
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
 *
 */
router.get('/:id', verifyAnyToken ,quotationController.getQuotationbyId);

export default router;