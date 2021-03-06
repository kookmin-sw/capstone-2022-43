import 'dotenv/config';
import './utils/passport/config';
import express from 'express';
import Route from './@types/Route';
import logger from './utils/logger';
import pageNotFoundRouter from './routes/pageNotFoundRouter';
import errorMiddleware from './middlewares/errorMiddleware';
import swaggerUi from 'swagger-ui-express';
import swaggerJsdoc from "./swagger.jsdoc";
import dataSource from "./data-source";


class App {
    private app: express.Application;
    public port: number;

    constructor(routes: Route[], port: number) {
        this.app = express();
        this.port = port;

        this.initializeApp();
        this.initializeApiDocs();
        this.initializeRouters(routes);
    };

    private initializeApp(): void {
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: false }));
        this.app.set("etag", false);
        process.env.TZ = 'Asia/Seoul';
    };

    private initializeApiDocs(): void {
        this.app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerJsdoc));
    };

    private initializeRouters(routes: Route[]): void {
        routes.forEach((route: Route) => {
            this.app.use(route.path, route.router);
        });
        this.app.use(pageNotFoundRouter);
        this.app.use(errorMiddleware);
    };

    public listen(): void {
        dataSource.initialize()
            .then((dataSource) => {
                console.log(`Success to connect ${ dataSource.options.type.toUpperCase() } Database`);
                this.app.listen(this.port, '0.0.0.0', () => {
                    logger.info(`Listening http://localhost:${ this.port }`);
                });
            })
            .catch((error) => {
                console.log(error);
            });
    }
}

export default App;
