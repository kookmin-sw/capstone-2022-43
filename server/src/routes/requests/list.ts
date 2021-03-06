import express, {Request, Response, NextFunction,} from 'express';
import { dateToUnix } from "../../middlewares/timeConvert";
import { verifyForwarderToken } from "../../middlewares/verifyToken";
import requestRepository from "../../repository/RequestRepository";
import printLog from "../../middlewares/printLog";


const router = express.Router();


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
router.get('/list', verifyForwarderToken, async (req : Request, res : Response, next : NextFunction) => {
    try {
        const list = await requestRepository.find({
            select: ['id', 'trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at']
        });

        list.forEach((selected_request) => {
            dateToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);
        });

        res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequests: list
        });
        return printLog(req, res);
    }
    catch (error) {
        return next(error);
    }
});

export default router;