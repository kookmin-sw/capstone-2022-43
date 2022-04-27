import express, { Router } from 'express';
import requestRouter from "./quote/request";
import listRouter from './quote/list';


const router = express.Router();
const lowRouters = [
    requestRouter,
    listRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/quote', lowRouter);
});

export default router;