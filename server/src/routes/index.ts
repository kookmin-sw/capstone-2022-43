import express, { Request, Response, NextFunction } from 'express';

const router = express.Router();


router.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.status(200).send('Hello world!');
});


router.get('/test', (req: Request, res: Response, next: NextFunction) => {
    res.status(400).json({name:"test"});
});

export = router;