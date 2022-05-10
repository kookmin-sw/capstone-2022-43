import express, { Request, Response, NextFunction } from 'express';
import verifyToken from "../../../middlewares/verifyToken";


const router = express.Router();

router.get('/token', verifyToken, async (req: Request, res: Response, next: NextFunction) => {
    try {
        return res.status(200).json({
            status: 200,
            message: 'Token is valid'
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;