import express from 'express';
import authRouter from './api/auth';
import quoteRouter from './api/quote';
const router = express.Router();

router.use('/quote', quoteRouter);
router.use('/auth', authRouter);

export default router;