<<<<<<< HEAD
import express, { Router } from "express";
import authRouter from "./api/auth";
import quoteRouter from "./api/quote";


=======
import express from 'express';
import authRouter from './api/auth';
import quoteRouter from './api/quote';
>>>>>>> origin/server-candidate
const router = express.Router();
const lowRouters = [
    authRouter,
    quoteRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/api', lowRouter);
});

export default router;