import express, { Router } from 'express';
import request from "./quote/request";


const router = express.Router();
const lowRouters = [
    request
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/quote', lowRouter);
});

export default router;