import HttpException from "../exceptions/HttpException";
import { NextFunction, Request, Response } from "express";
import useragent from "useragent";
import requestIp from "request-ip";
import logger from "../utils/logger";
import userAgent from "../@types/UserAgent";


const errorMiddleware = (err: HttpException, req: Request, res: Response, next: NextFunction): void => {
    const userInfo = new userAgent(req);
    logger.error(err.status + " " + err.message + userInfo);
    const status = err.status || 500;
    res.status(status).send({ status, message: err.message });
};

export default errorMiddleware;
