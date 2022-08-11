import express, {Request, Response, NextFunction,} from 'express';
import { verifyForwarderToken } from "../../middlewares/verifyToken";
import RequestController from "../../controller/RequestController";


const router = express.Router();
const requestController: RequestController = new RequestController();

/**
 * @swagger
 * /api/requests/list:
 *   get:
 *     tags: [/api/requests]
 *     summary: Respond all quote request
 *     security:
 *     - ForwarderToken: []
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
router.get('/list', verifyForwarderToken, requestController.getList);

export default router;