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
    public signUp = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { email, password, name, phone_number, corporation_name, corporation_number } = req.body;

            const hash = await bcrypt.hash(password, 14);
            const forwarder: Forwarder = new Forwarder(name, phone_number, email, hash, corporation_name, corporation_number);
            await this.forwarderService.join(forwarder);

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


    public logIn = async (req: Request, res: Response, next: NextFunction) => {
        passport.authenticate('local', (authError, user, info) => {
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
            }, process.env.JWT_SECRET || '', {
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