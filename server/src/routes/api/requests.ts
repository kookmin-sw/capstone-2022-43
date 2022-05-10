import express, { Router } from "express";
import indexRouter from "./requests/index";
import paramIdRouter from "./requests/:id";
import requestRouter from "./requests/request";
import listRouter from "./requests/list";
import responseRouter from "./requests/response";


const router = express.Router();
const lowRouters = [
    indexRouter,
    paramIdRouter,
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/requests', lowRouter);
});

export default router;