import 'dotenv/config';
import './utils/passport/config';
import express from 'express';
import Route from "./@types/Route";
import logger from './utils/logger';
import pageNotFoundRouter from './routes/pageNotFoundRouter';
import errorMiddleware from './middlewares/errorMiddleware';
import loggerMiddleware from "./middlewares/loggerMiddleware";


class App {
    public app: express.Application;
    public port: number;

    constructor(routes: Route[], port: number) {
        this.app = express();
        this.port = port;

        this.initializeApp();
        this.initializeMiddlewares();
        this.initializeRouters(routes);
    };

    private initializeApp(): void {
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: false }));
    };

    private initializeMiddlewares(): void {
        this.app.use(loggerMiddleware);
    };

    private initializeDB(): void {

    };

    private initializeRouters(routes: Route[]): void {
        routes.forEach((route: Route) => {
            this.app.use(route.path, route.router);
        });
        this.app.use(pageNotFoundRouter);
        this.app.use(errorMiddleware);
    };

    public listen(): void {
        this.app.listen(this.port, '0.0.0.0', () => {
            logger.info(`Listening http://localhost:${ this.port }`);
        });
    };
}

export default App;
