import express, { NextFunction, Request, Response } from 'express';


const router = express.Router();

router.get('/', (req: Request, res: Response, next: NextFunction) => {
    return res.status(200).send('Hello world!');
});

export default router;