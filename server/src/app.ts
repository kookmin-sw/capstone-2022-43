import express, { Request, Response, NextFunction } from 'express';
import HttpException from "./middlewares/HttpException";
import 'dotenv/config';
import './utils/passport/config';

import indexRouter from './routes/index';
import apiRouter from './routes/api';


const app = express();

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
    console.log(err);
    res.locals.message = err.message;
    res.locals.error = process.env.NODE_ENV === 'develop' ? err : {};
    res.status(err.status || 500).send();
});

app.listen(app.get('port'), () => {
    console.log(`Listening http://localhost:${ app.get('port') }`);
});