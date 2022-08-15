import express, { Request, Response, NextFunction } from 'express';
import { verifyAnyToken } from '../../middlewares/verifyToken';
import axios from 'axios';
import HttpException from "../../exceptions/HttpException";
import printLog from "../../middlewares/printLog";


const router = express.Router();

/**
 * @swagger
 * /api/hscode/{code}:
 *   get:
 *     tags: [/api/hscode]
 *     summary: HSCode recommendation API for any users
 *     parameters:
 *     - name: code
 *       in: path
 *       description: Code to find hscode
 *       required: true
 *       type: string
 *     security:
 *     - OwnerToken: []
 *     - ForwarderToken: []
 *     responses:
 *       200:
 *         description: Success to get hscode
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to get hscode
 *                 hscode:
 *                   type: array
 *                   example: ["11 : 맥아전분"]
 *       202:
 *         description: Success but no matching data
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success but no matching data
 *                 hscode:
 *                   type: array
 *                   example: []
 *       400:
 *         description: Bad request
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Bad request
 */
router.get('/:code', verifyAnyToken, async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { data: proxy_response } = await axios.get(encodeURIComponent(req.params.code), {
            baseURL: process.env.HSCODE_SERVER_HOST
        });
        res.status(proxy_response.status).json(proxy_response);
        return printLog(req, res);
    } catch (error) {
        if (axios.isAxiosError(error)) {
            return next(new HttpException(400, 'Bad request'));
        } else {
            return next(error as HttpException);
        }
    }
});

export default router;