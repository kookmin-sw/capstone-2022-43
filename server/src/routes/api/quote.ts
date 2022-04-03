import express from 'express';
import QuoteRequestRouter from "./quote/QuoteRequest";

const router = express.Router();

router.use('/QuoteRequest', QuoteRequestRouter);

export default router;