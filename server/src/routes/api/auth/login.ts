import express, { Request, Response, NextFunction } from "express";
import passport from "passport";
import jwt from "jsonwebtoken";
import HttpException from "../../../exceptions/HttpException";
import ShipperController from "../../../controller/ShipperController";


const router = express.Router();
const shipperController: ShipperController = new ShipperController();
console.log(shipperController);
router.post('/login', (req: Request, res: Response, next: NextFunction) => {
    passport.authenticate('local', (authError, user, info) => {
        if (authError) {
            return next(authError);
        }
        if (!user) {
            return next(new HttpException(info.status, info.message));
        }

        const token = jwt.sign({
            uuid: user.uuid,
            email: user.email,
            name: user.name,
        }, process.env.JWT_SECRET || '', {
            expiresIn: '7d',
            issuer: 'BAETAVERSE-DEV'
        });

        return res.status(200).json({
            status: info.status,
            message: info.message,
            token,
        });
    }) (req, res, next);
});

export default router;