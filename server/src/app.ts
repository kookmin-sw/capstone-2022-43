import express, { Request, Response, NextFunction } from 'express';
import useragent from "useragent";
import requestIp from "request-ip";
import HttpException from './@types/HttpException';
import logger from './middlewares/logger';
import 'dotenv/config';
import './utils/passport/config';
import indexRouter from './routes/index';
import apiRouter from './routes/api';


const app: express.Application = express();

app.set('port', process.env.PORT || 8080);
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/', indexRouter);
app.use('/api', apiRouter);


app.use((req: Request, res: Response, next: NextFunction) => {
    logger.info(`${req.method} ${req.url}`);
    const error =  new HttpException(404, `Not exist ${ req.method } ${ req.url } router`);
    next(error);
});

app.use((err: HttpException, req: Request, res: Response, next: NextFunction) => {
    const user = req.headers['user-agent'];
    const userOS = useragent.parse(user).os.toString();
    const userBrowser = useragent.parse(user).toAgent();
    const ip = requestIp.getClientIp(req);
    const userInfo : string = ` IP: ${ ip } OS : ${ userOS } Browser : ${ userBrowser }`

    logger.error(err.status + " " + err.message + userInfo);
    res.status(err.status || 500).send();
});

app.listen(app.get('port'), '0.0.0.0', () => {
    logger.info(`Listening http://localhost:${ app.get('port') }`);
});