import 'dotenv/config';
import './utils/passport/config';
import express from 'express';
import Route from './@types/Route';
import logger from './utils/logger';
import pageNotFoundRouter from './routes/pageNotFoundRouter';
import errorMiddleware from './middlewares/errorMiddleware';
import swaggerUi from 'swagger-ui-express';
import swaggerJsdoc from "./swagger.jsdoc";
import AdminJSManager from "./adminJSManager";
import { DataSource } from "typeorm";


class App {
    private app: express.Application;
    private port: number;

    constructor(port: number) {
        this.app = express();
        this.port = port;
    };

    public initializeApp(): void {
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: false }));
        this.app.set("etag", false);
        process.env.TZ = 'Asia/Seoul';
    };

    public initializeRouters(routes: Route[]): void {
        routes.forEach((route: Route) => {
            this.app.use(route.path, route.router);
        });
    };

    public initializeApiDocs(): void {
        this.app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerJsdoc));
    };

    public initializeAdminRouter(dataSource: DataSource): void {
        const admin = new AdminJSManager(dataSource);
        this.app.use(admin.getPath(), admin.getRouter());
    };

    public initializeHandlerRouter(): void {
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
