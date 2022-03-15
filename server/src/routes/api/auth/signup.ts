import express, { Request, Response, NextFunction } from "express";

const router = express.Router();

router.post('/', (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id, password, name } = req.body;
        res.status(200).json({ id, password, name });
    } catch (error) {
        console.log(error);
        return next(error);
    }
});

export default router;