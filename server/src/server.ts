import validateEnv from "./utils/vaildateEnv";
import App from './app';
import Route from "./@types/Route";
import indexRouter from './routes/index';
import authRouter from './routes/auth';
import hscodeRouter from './routes/hscode';
import requestRouter from './routes/requests';


validateEnv();

const indexRoute = new Route('/', indexRouter);
const authRoute = new Route('/api', authRouter);
const hscodeRoute = new Route('/api', hscodeRouter);
const requestRoute = new Route('/api', requestRouter);

const app = new App(
    [
        hscodeRoute,
        requestRoute,
        indexRoute,
        authRoute
    ],
    Number(process.env.PORT) || 8080,
);

app.listen();
