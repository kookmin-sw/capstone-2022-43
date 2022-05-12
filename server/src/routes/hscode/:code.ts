import express, { Request, Response, NextFunction } from 'express';
import verifyToken from '../../middlewares/verifyToken';
import axios from 'axios';
import logger from "../../utils/logger";
import HttpException from "../../exceptions/HttpException";


const router = express.Router();

router.get('/:code', verifyToken, async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { data: proxy_response } = await axios.get(encodeURIComponent(req.params.code), {
            baseURL: process.env.HSCODE_SERVER_HOST
        });
        return res.status(proxy_response.status).json(proxy_response);
    } catch (error) {
        if (axios.isAxiosError(error)) {
            return res.status(400).json({ 'status': 400, message: 'Bad request' });
        } else {
            return next(error as HttpException);
        }
    }
});

export default router;