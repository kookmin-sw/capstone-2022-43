import express, { Router } from 'express';
import requestRouter from "./quote/request";
import listRouter from './quote/list';
import responseRouter from "./quote/response";
import quotation from "../../middlewares/quoteid";

const router = express.Router();
const lowRouters = [
    requestRouter,
    listRouter,
    responseRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/quote', lowRouter);
});

router.get('/quote/:quoteId', quotation);

export default router;