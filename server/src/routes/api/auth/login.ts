<<<<<<< HEAD
import express, { Request, Response, NextFunction } from "express";
import passport from "passport";
import jwt from "jsonwebtoken";
import HttpException from "../../../exceptions/HttpException";
=======
import express, { Request, Response, NextFunction } from 'express';
import passport from 'passport';
import jwt from 'jsonwebtoken';
import HttpException from '../../../@types/HttpException';
>>>>>>> origin/server-candidate


const router = express.Router();

router.post('/login', (req: Request, res: Response, next: NextFunction) => {
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
    }) (req, res, next);
});

export default router;