import { NextFunction, Request, Response } from "express";
import logger from "../utils/logger";
import userAgent from "../@types/UserAgent";


const printLog = (req: Request, res: Response): void => {
    const userInfo = new userAgent(req);
    logger.info(`${ res.statusCode } ${ req.method } ${ decodeURI(req.path) } ${ userInfo }`);
}

export default printLog;