import HttpException from "../exceptions/HttpException";
import { NextFunction, Request, Response } from "express";
import useragent from "useragent";
import requestIp from "request-ip";
import logger from "../utils/logger";


const errorMiddleware = (err: HttpException, req: Request, res: Response, next: NextFunction): void => {
    const user = req.headers['user-agent'];
    const userOS = useragent.parse(user).os.toString();
    const userBrowser = useragent.parse(user).toAgent();
    const ip = requestIp.getClientIp(req);
    const userInfo : string = ` IP: ${ ip } OS : ${ userOS } Browser : ${ userBrowser }`

    logger.error(err.status + " " + err.message + userInfo);
    res.status(err.status || 500).send();
};

export default errorMiddleware;
