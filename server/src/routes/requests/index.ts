import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import RequestController from "../../controller/RequestController";


const router = express.Router();
const requestController: RequestController = new RequestController();

/**
 * @swagger
 * /api/requests:
 *   get:
 *     tags: [/api/requests]
 *     summary: Respond quote requests, that are matched with users token
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
 *                 message:
 *                   type: string
 *                   example: Success to find requests
 *                 result:
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
 *     summary: Create instances to REQUESTS table, After then respond created quote request data
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
 *             - product_name
 *             - product_price
 *             - product_weight
 *             - standard_unit
 *             - hscode
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
 *               product_name:
 *                 type: string
 *                 example: your_product_name
 *               product_price:
 *                 type: number
 *                 example: 1234
 *               product_weight:
 *                 type: number
 *                 example: 1234
 *               standard_unit:
 *                 type: string
 *                 example: your_standard_unit
 *               hscode:
 *                 type: string
 *                 example: your_hscode
 *               trade_type:
 *                 type: string
 *                 example: your_request
 *               trade_detail:
 *                 type: string
 *                 example: your_request
 *               forwarding_date:
 *                 type: timestamp
 *                 example: 2000-01-01 00:00:00
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
 *                 type: timestamp
 *                 example: 2000-01-01 00:00:00
 *     responses:
 *       200:
 *         description: Success to quote_request
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to quote_request
 */
router.post('/', verifyOwnerToken, requestController.registerRequest);

export default router;