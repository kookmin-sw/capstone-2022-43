import express from 'express';
import signupRouter from './auth/signup';
import loginRouter from './auth/login';

const router = express.Router();

router.use('/signup', signupRouter);
router.use('/login', loginRouter);

export default router;