import validateEnv from "./utils/vaildateEnv";
import App from './app';
import Route from "./@types/Route";
import indexRouter from './routes/index';
import authRouter from './routes/auth';
import hscodeRouter from './routes/hscode';
import requestRouter from './routes/requests';
import quotationRouter from './routes/quotations';
import reviewRouter from './routes/reviews';

validateEnv();

const indexRoute = new Route('/', indexRouter);
const authRoute = new Route('/api', authRouter);
const hscodeRoute = new Route('/api', hscodeRouter);
const requestRoute = new Route('/api', requestRouter);
const quotationRoute = new Route('/api', quotationRouter);
const reviewRoute = new Route('/api', reviewRouter);
const app = new App([
        indexRoute,
        authRoute,
        hscodeRoute,
        requestRoute,
        quotationRoute,
        reviewRoute
    ],
    Number(process.env.PORT) || 8080,
);

app.listen();
