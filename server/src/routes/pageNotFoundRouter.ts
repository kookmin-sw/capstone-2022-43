import { NextFunction, Request, Response } from "express";
import HttpException from "../exceptions/HttpException";


const pageNotFoundRouter = (req: Request, res: Response, next: NextFunction): void => {
    const error =  new HttpException(404, 'Page not found');
    next(error);
}

export default pageNotFoundRouter;
