import express, { Request, Response, NextFunction } from 'express';
import { verifyAnyToken, verifyOwnerToken, verifyForwarderToken } from "../../middlewares/verifyToken";


const resToken = (req: Request, res: Response, next: NextFunction) => {
    try {
        return res.status(200).json({
            status: 200,
            message: 'Token is valid',
            name: req.decoded.name,
        });
    }
    catch (error){
        return next(error);
    }
}

const router = express.Router();

router.get('/token/owner', verifyOwnerToken, resToken);
router.get('/token/forwarder', verifyForwarderToken, resToken);
router.get('/token', verifyAnyToken, resToken);

export default router;