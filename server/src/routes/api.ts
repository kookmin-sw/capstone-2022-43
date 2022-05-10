import express, { Router } from "express";
import authRouter from "./api/auth";
import requestRouter from "./api/requests";
import hscodeRouter from "./api/hscode";


const router = express.Router();
const lowRouters = [
    authRouter,
    requestRouter,
    hscodeRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/api', lowRouter);
});

export default router;