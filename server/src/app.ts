import express, { Request, Response, NextFunction } from 'express';
import HttpException from "./middlewares/HttpException";
import 'dotenv/config';

import indexRouter from './routes/index';
import logger from './middlewares/logger';


const app = express();
const requestIp = require('request-ip');
const Sniffr = require('sniffr');

app.set('port', process.env.PORT || 8080);

app.use('/', indexRouter);

app.use((req: Request, res: Response, next: NextFunction) => {

    const error =  new HttpException(404, `Not exist ${ req.method } ${ req.url } router`);
    next(error);
});

app.use((err: HttpException, req: Request, res: Response, next: NextFunction) => {
    const userAgent = req.headers['user-agent'];
    const ip = requestIp.getClientIp(req);
    const s = new Sniffr;
    s.sniff(userAgent);
    const userInfo : string = ` IP: ${ ip } OS : ${ s.os.name } Browser : ${ s.browser.name }`
    logger.error(err.status + " " + err.message + userInfo);

    res.status(err.status || 500).send();
});



app.listen(app.get('port'),'0.0.0.0' ,() => {
    console.log('Running server...');
});