import express, { Request, Response, NextFunction } from "express";
import jwt, { JwtPayload } from "jsonwebtoken";
import HttpException from "../exceptions/HttpException";


const verifyToken = (req: Request, res: Response, next: NextFunction) => {
    try {
        const bearerToken: string = req.headers.authorization || 'Bearer ';
        req.decoded = jwt.verify(bearerToken.split('Bearer ')[1], process.env.JWT_SECRET || '');
        return next();
    } catch (err) {
        const error = err as HttpException;
        if (error.name === 'TokenExpiredError') {
            error.status = 419;
            error.message = 'The token has expired';
        } else {
            error.status = 401;
            error.message = 'Invalid token';
        }
        return next(error);
    }
};

export default verifyToken;