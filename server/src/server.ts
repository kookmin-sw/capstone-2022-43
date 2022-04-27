import App from './app';
import validateEnv from "./utils/vaildateEnv";
import indexRouter from './routes/index';
import apiRouter from './routes/api';


validateEnv()

const app = new App(
    [
        indexRouter,
        apiRouter,
    ],
    Number(process.env.PORT) || 8080,
);

app.listen();
