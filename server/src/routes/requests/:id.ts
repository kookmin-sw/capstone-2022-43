import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import RequestController from "../../controller/RequestController";
import QuotationController from "../../controller/QuotationController";


const router = express.Router();
const requestController: RequestController = new RequestController();
const quotationController: QuotationController = new QuotationController();
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
 *                 message:
 *                   type: string
 *                   example: Success to find request
 *                 result:
 *                   $ref: '#/components/schemas/Request'
 *       403:
 *         description: Wrong request id
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Wrong request id
 *
 */
router.get('/:id', verifyOwnerToken , requestController.getRequestsById);

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
 *                 message:
 *                   type: string
 *                   example: Success to find quotations
 *                 result:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Quotation'
 *       403:
 *         description: Wrong request id
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Wrong request id
 *
 */
router.get('/:id/quotations', verifyOwnerToken , quotationController.getQuotationbyId);

export default router;