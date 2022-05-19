import express, { Request, Response, NextFunction } from 'express';
import { verifyAnyToken } from '../../middlewares/verifyToken';
import axios from 'axios';
import HttpException from "../../exceptions/HttpException";
import printLog from "../../middlewares/printLog";


const router = express.Router();

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