import express, { Router } from 'express';
import paramCodeRouter from './hscode/:code';


const router = express.Router();

const lowRouters = [
    paramCodeRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/hscode', lowRouter);
});

export default router;