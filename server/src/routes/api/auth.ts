import express, { Router } from 'express';
import signupRouter from './auth/signup';
import loginRouter from './auth/login';


const router = express.Router();
const lowRouters = [
    signupRouter,
    loginRouter
];

lowRouters.forEach((lowRouter: Router) => {
    router.use('/auth', lowRouter);
});

export default router;