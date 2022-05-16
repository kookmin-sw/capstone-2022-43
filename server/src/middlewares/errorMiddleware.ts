import HttpException from "../exceptions/HttpException";
import { NextFunction, Request, Response } from "express";
import logger from "../utils/logger";
import userAgent from "../@types/UserAgent";


const errorMiddleware = (err: HttpException, req: Request, res: Response, next: NextFunction): Response => {
    const userInfo = new userAgent(req);
    const status = err.status || 500;
    logger.error(`${ status } ${ err.message } ${ decodeURI(req.originalUrl) } ${ userInfo }`);
    return res.status(status).send({ status, message: err.message });
};

export default errorMiddleware;
