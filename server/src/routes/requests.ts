import express, { Router } from "express";
import indexRouter from "./requests/index";
import paramIdRouter from "./requests/:id";
import listRouter from "./requests/list";


const router: Router = express.Router();

const lowRouters: Router[] = [
    indexRouter,
    // responseRouter,
    listRouter,
    paramIdRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/requests', lowRouter);
});


export default router;