import express, { Router } from 'express';
import indexRouter from './users/index';


const router = express.Router();

const lowRouters = [
    indexRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/users', lowRouter);
});

export default router;