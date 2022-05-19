import express, { NextFunction, Request, Response } from 'express';
import printLog from "../middlewares/printLog";


const router = express.Router();

router.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.status(200).send('Hello world!');
    return printLog(req, res);
});

export default router;