import { Request, Response, NextFunction } from "express";
import HttpException from "../exceptions/HttpException";
import bcrypt from "bcrypt";
import ForwarderService from "../service/ForwarderService";
import passport from "passport";
import jwt from "jsonwebtoken";
import Forwarder from "../domain/Forwarder";
import printLog from "../middlewares/printLog";


class ForwarderController {
    private forwarderService : ForwarderService = new ForwarderService();

    public signup = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const reqForwarder = req.body as Forwarder;

            reqForwarder.password = await bcrypt.hash(reqForwarder.password!, 12);
            const forwarder = await this.forwarderService.join(reqForwarder);

            res.status(200).json({
                status: 200,
                message: 'Success to sign up',
                email: forwarder.email,
                name: forwarder.name
            });
            return printLog(req, res);
        } catch (error) {
            return next(error);
        }
    }


    public login = (req: Request, res: Response, next: NextFunction) => {
        passport.authenticate('forwarder', (authError, user, info) => {
            if (authError) {
                return next(authError);
            }
            if (!user) {
                return next(new HttpException(400, info.message));
            }

            const token = jwt.sign({
                uuid: user.uuid,
                email: user.email,
                name: user.name
            }, process.env.JWT_FORWARDER_SECRET!, {
                expiresIn: '7d',
                issuer: 'BAETAVERSE-DEV'
            });

            res.status(200).json({
                status: 200,
                message: info.message,
                token,
            });
            return printLog(req, res);
        })(req, res, next);
    };
}

export default ForwarderController;