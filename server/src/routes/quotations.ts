import express, { Router } from 'express';
import indexRouter from "./quotations/index"
import paramIdRouter from "./quotations/:id"

const router = express.Router();

const lowRouters = [
    indexRouter,
    paramIdRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/quotations', lowRouter);
});

export default router;