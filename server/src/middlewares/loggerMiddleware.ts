import { NextFunction, Request, Response } from "express";
import logger from "../utils/logger";


const loggerMiddleware = (req: Request, res: Response, next: NextFunction): void => {
    logger.info(`${req.method} ${req.path}`);
    next();
}