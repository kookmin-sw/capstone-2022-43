import { NextFunction, Request, Response } from "express";
import HttpException from "../exceptions/HttpException";
import bcrypt from "bcrypt";
import passport from "passport";
import jwt from "jsonwebtoken";
import Owner from "../domain/Owner";
import OwnerService from "../service/OwnerService";
import printLog from "../middlewares/printLog";
import ownerRepository from "../repository/OwnerRepository";


class OwnerController {
    private ownerService : OwnerService = new OwnerService();

    public getOwner = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { owner_uuid } = req.body;

            const owner= await ownerRepository.findOneOrFail({
                where: {uuid: owner_uuid}
            });

            res.status(200).json({
                message: 'Success to find owner',
                result: owner,

            });

            return printLog(req, res);
        } catch (error) {
            return next(error);
        }
    }

    public signup = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const reqOwner = req.body as Owner;

            reqOwner.password = await bcrypt.hash(reqOwner.password!, 12);
            const owner: Owner = await this.ownerService.join(reqOwner);

            res.status(200).json({
                message: 'Success to sign up',
            });
            return printLog(req, res);
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

            res.status(200).json({
                message: info.message,
                token,
            });
            return printLog(req, res);
        })(req, res, next);
    };
}

export default OwnerController;