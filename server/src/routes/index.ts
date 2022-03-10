import express, { Request, Response, NextFunction } from 'express';

const router = express.Router();


router.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.status(200).send('Hello world!');
});

export = router;