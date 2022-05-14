import express, { Router } from 'express';
import indexRouter from "./review/index"


const router = express.Router();

const lowRouters = [
    indexRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/review', lowRouter);
});

export default router;