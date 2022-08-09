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
 *     summary: Respond matched quotation info, forwarder info, request and goods data
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
 *                   items:
 *                     $ref: '#/components/schemas/Goods'
 *
 */
router.get('/:id', verifyAnyToken ,quotationController.getQuotationbyId);

export default router;