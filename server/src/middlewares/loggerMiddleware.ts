import { NextFunction, Request, Response } from "express";
import logger from "../utils/logger";
import userAgent from "../@types/UserAgent";


const loggerMiddleware = (req: Request, res: Response, next: NextFunction): void => {
    const userInfo = new userAgent(req);
    logger.info(`${req.method} ${req.path} ${userInfo}`);
    next();
}

export default loggerMiddleware;