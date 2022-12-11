import validateEnv from "./utils/vaildateEnv";
import App from './app';
import Route from "./@types/Route";
import indexRouter from './routes/index';
import authRouter from './routes/auth';
import hscodeRouter from './routes/hscode';
import requestRouter from './routes/requests';
import quotationRouter from './routes/quotations';
import reviewRouter from './routes/reviews';
import userRouter from './routes/users'
import dataSource from "./data-source";

validateEnv();

const indexRoute = new Route('/', indexRouter);
const authRoute = new Route('/api', authRouter);
const hscodeRoute = new Route('/api', hscodeRouter);
const requestRoute = new Route('/api', requestRouter);
const quotationRoute = new Route('/api', quotationRouter);
const reviewRoute = new Route('/api', reviewRouter);
const userRoute = new Route('/api', userRouter);

const routes = [
        indexRoute,
        authRoute,
        hscodeRoute,
        requestRoute,
        quotationRoute,
        reviewRoute,
        userRoute
];

const app = new App(Number(process.env.PORT) || 8080);

dataSource.initialize()
.then((dataSource) => {
        console.log(`Success to connect ${ dataSource.options.type.toUpperCase() } Database`);
        app.initializeAdminRouter(dataSource);
        app.initializeApp();
        app.initializeRouters(routes);
        app.initializeApiDocs();
        app.initializeHandlerRouter();
        app.listen();
})
.catch(console.log);
