import { NextFunction, Request, Response } from "express";
import HttpException from "../exceptions/HttpException";


const pageNotFoundRouter = (req: Request, res: Response, next: NextFunction): void => {
    const error =  new HttpException(404, `No exist ${ req.method } ${ req.url } router`);
    next(error);
}

export default pageNotFoundRouter;
