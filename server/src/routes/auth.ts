import express, { Router } from 'express';
import signupRouter from './auth/signup';
import loginRouter from './auth/login';
import tokenRouter from './auth/token';


const router = express.Router();
const lowRouters = [
    signupRouter,
    loginRouter,
    tokenRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/auth', lowRouter);
});

export default router;