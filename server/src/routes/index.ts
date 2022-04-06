import express, { Request, Response, NextFunction } from 'express';
import verifyToken from '../middlewares/verifyToken';

const router = express.Router();


router.get('/', (req: Request, res: Response, next: NextFunction) => {
    return res.status(200).send('Hello world!');
});


router.get('/test', verifyToken, (req: Request, res: Response, next: NextFunction) => {
    return res.status(200).json({ name: "test", decoded: req.decoded });
});

export default router;