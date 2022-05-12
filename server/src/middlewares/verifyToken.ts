import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import HttpException from '../exceptions/HttpException';
import DecodedToken from "../interfaces/DecodedToken";


const verifyToken = (req:Request, res: Response, next: NextFunction) => {
    try {
        const bearerToken: string = req.headers.authorization || 'Bearer ';
        const decode_token = jwt.verify(
            bearerToken.split('Bearer ')[1],
            process.env.JWT_SECRET || ''
        );
        req.decoded = decode_token as DecodedToken;
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