import {NextFunction, Request, Response} from "express";
import {supabase} from "../utils/supabase";
import HttpException from "../exceptions/HttpException";
import bcrypt from "bcrypt";
import ShipperService from "../service/ShipperService";
import Shipper from "../domain/Shipper";
import shipperService from "../service/ShipperService";
import passport from "passport";
import jwt from "jsonwebtoken";

class ShipperController {
    private shipperService : ShipperService = new ShipperService();


    public signUp = async (req: Request, res: Response, next: NextFunction) => {
            try {
                const { email, password, name } = req.body;
                shipperService.checkDupliated(email);

                const hash = await bcrypt.hash(password, 14);

                const shipper: Shipper = new Shipper(name,"id" ,email ,hash);

                shipperService.join(shipper);

                return res.status(200).json({ message: 'Success to sign up' });

            } catch (error) {
                console.log(error);
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
                expiresIn: '1h',
                issuer: 'BAETAVERSE'
            });

            return res.status(200).json({
                message: info.message,
                token,
            });
        })(req, res, next);
    };
}

export default ShipperController;