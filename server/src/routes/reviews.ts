import express, { Router } from 'express';
import indexRouter from "./reviews/index"


const router = express.Router();

const lowRouters = [
    indexRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/reviews', lowRouter);
});

export default router;