import express from 'express';
import signupRouter from './auth/signup';

const router = express.Router();

router.use('/signup', signupRouter);

export default router;