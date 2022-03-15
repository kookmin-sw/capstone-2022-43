import express from "express";
import authRouter from "./api/auth";

const router = express.Router();

router.use('/auth', authRouter);

export default router;