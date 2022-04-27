import express, { Request, Response, NextFunction } from 'express';
import useragent from 'useragent';
import requestIp from 'request-ip';
import HttpException from './@types/HttpException';
import logger from './middlewares/logger';
import 'dotenv/config';
import './utils/passport/config';
import indexRouter from './routes/index';
import apiRouter from './routes/api';
import UserAgent from './@types/UserAgent';


const app: express.Application = express();

app.set('port', process.env.PORT || 8080);
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/', indexRouter);
app.use('/api', apiRouter);


app.use((req: Request, res: Response, next: NextFunction) => {
    logger.info(`${req.method} ${req.url}`);

    const error =  new HttpException(404, `Not exist ${ req.method } ${ req.url } router`);
    next(error);
});

app.use((err: HttpException, req: Request, res: Response, next: NextFunction) => {
    const userInfo = new UserAgent(req);
    logger.error(err.status + ' ' + err.message + userInfo);
    res.status(err.status || 500).send();
});

if (process.env.NODE_ENV !== 'test') {
    app.listen(app.get('port'), '0.0.0.0', () => {
        logger.info(`Listening http://localhost:${ app.get('port') }`);
    });
}


module.exports = app;