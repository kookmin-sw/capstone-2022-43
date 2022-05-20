import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import HttpException from '../exceptions/HttpException';
import DecodedToken from "../interfaces/DecodedToken";


type ResVerify =  {
    isValid: boolean;
    decoded: DecodedToken;
    error: HttpException;
};

const verifyToken = (token: string, key: string): ResVerify => {
    const result = { isValid: true } as ResVerify;
    try {
        const decode_token = jwt.verify(token.split('Bearer ')[1], key);
        result.decoded = decode_token as DecodedToken;
    } catch (err) {
        const error = err as HttpException;
        if (error.name === 'TokenExpiredError') {
            error.status = 419;
            error.message = 'The token has expired';
        } else {
            error.status = 401;
            error.message = 'Invalid token';
        }
        result.isValid = false;
        result.error = error;
    }
    return result;
}

const verifyOwnerToken = (req: Request, res: Response, next: NextFunction) => {
    try {
        const { isValid, decoded, error } = verifyToken(
            req.headers.authorization || 'Bearer ',
            process.env.JWT_OWNER_SECRET || ''
        );
        if (!isValid) {
            return next(error);
        }
        req.decoded = decoded;
        return next();
    } catch (err) {
        return next(err);
    }
};

const verifyForwarderToken = (req: Request, res: Response, next: NextFunction) => {
    try {
        const { isValid, decoded, error } = verifyToken(
            req.headers.authorization || 'Bearer ',
            process.env.JWT_FORWARDER_SECRET || ''
        );
        if (!isValid) {
            return next(error);
        }
        req.decoded = decoded;
        return next();
    } catch (err) {
        return next(err);
    }
};

const verifyAnyToken = (req: Request, res: Response, next: NextFunction) => {
    try {
        const ownerResult = verifyToken(
            req.headers.authorization || 'Bearer ',
            process.env.JWT_OWNER_SECRET || ''
        );
        if (ownerResult.isValid) {
            req.decoded = ownerResult.decoded;
            req.decoded.role = 'owner';
            return next();
        }
        if (ownerResult.error.status === 419) {
            return next(ownerResult.error);
        }

        const forwarderResult = verifyToken(
            req.headers.authorization || 'Bearer ',
            process.env.JWT_FORWARDER_SECRET || ''
        );
        if (forwarderResult.isValid) {
            req.decoded = forwarderResult.decoded;
            req.decoded.role = 'forwarder';
            return next();
        }
        return next(forwarderResult.error);

    } catch (err) {
        return next(err);
    }
};


export { verifyOwnerToken, verifyForwarderToken, verifyAnyToken };