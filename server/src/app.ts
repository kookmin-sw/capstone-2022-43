import express, { Request, Response, NextFunction } from 'express';
import HttpException from './@types/HttpException';
import logger from './middlewares/logger';
import 'dotenv/config';
import './utils/passport/config';

import indexRouter from './routes/index';
import apiRouter from './routes/api';

const app: express.Application = express();
const requestIp = require('request-ip');
const Sniffr = require('sniffr');

app.set('port', process.env.PORT || 8080);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/', indexRouter);
app.use('/api', apiRouter);

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

app.listen(app.get('port'), '0.0.0.0', () => {
    console.log(`Listening http://localhost:${ app.get('port') }`);
});