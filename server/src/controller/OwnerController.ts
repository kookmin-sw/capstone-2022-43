import {NextFunction, Request, Response} from "express";
import HttpException from "../exceptions/HttpException";
import bcrypt from "bcrypt";
import passport from "passport";
import jwt from "jsonwebtoken";
import Owner from "../domain/Owner";
import OwnerService from "../service/OwnerService";


class OwnerController {
    private ownerService : OwnerService = new OwnerService();
    public signUp = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { email, password, name, phone_number } = req.body;

            const hash = await bcrypt.hash(password, 14);
            const owner: Owner = new Owner(name, phone_number, email, hash);
            await this.ownerService.join(owner);

            return res.status(200).json({
                status: 200,
                message: 'Success to sign up',
                email: owner.email,
                name: owner.name
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

export default OwnerController;