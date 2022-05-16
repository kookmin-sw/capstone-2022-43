import {NextFunction, Request, Response} from "express";
import {supabase} from "../utils/supabase";
import HttpException from "../exceptions/HttpException";
import bcrypt from "bcrypt";
import ForwarderService from "../service/ForwarderService";
import passport from "passport";
import jwt from "jsonwebtoken";
import Forwarder from "../domain/Forwarder";


class ForwarderController {
    private forwarderService : ForwarderService = new ForwarderService();

    public signup = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { email, password, name, phone_number, corporation_name, corporation_number } = req.body;

            const hash = await bcrypt.hash(password, 12);
            const forwarder = await this.forwarderService.join({
                email,
                password: hash,
                name, phone_number, corporation_name, corporation_number
            });

            return res.status(200).json({
                status: 200,
                message: 'Success to sign up',
                email: forwarder.email,
                name: forwarder.name
            });
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

            return res.status(200).json({
                message: info.message,
                token,
            });
        })(req, res, next);
    };
}

export default ForwarderController;