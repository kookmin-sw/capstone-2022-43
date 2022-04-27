import express, { Router } from "express";
import authRouter from "./api/auth";
import quoteRouter from "./api/quote";

const router = express.Router();
const lowRouters = [
    authRouter,
    quoteRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/api', lowRouter);
});

export default router;