import { NextFunction, Request, Response } from "express";
import HttpException from "../exceptions/HttpException";
import bcrypt from "bcrypt";
import passport from "passport";
import jwt from "jsonwebtoken";
import Owner from "../domain/Owner";
import OwnerService from "../service/OwnerService";


class OwnerController {
    private ownerService : OwnerService = new OwnerService();

    public signup = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const reqOwner = req.body as Owner;

            reqOwner.password = await bcrypt.hash(reqOwner.password!, 12);
            const owner: Owner = await this.ownerService.join(reqOwner);

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


    public login = (req: Request, res: Response, next: NextFunction) => {
        passport.authenticate('owner', (authError, user, info) => {
            if (authError) {
                return next(authError);
            }
            if (!user) {
                return next(new HttpException(info.status, info.message));
            }

            const token = jwt.sign({
                uuid: user.uuid,
                email: user.email,
                name: user.name
            }, process.env.JWT_OWNER_SECRET!, {
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