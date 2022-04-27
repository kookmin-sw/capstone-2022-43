import express, { Request, Response, NextFunction } from 'express';
import QuoteRequestRouter from './quote/QuoteRequest';
import logger from "../../middlewares/logger";
import { supabase } from "../../utils/supabase";
import listRouter from "./quote/list";

const router = express.Router();


router.use('/list', listRouter);
router.use('/QuoteRequest', QuoteRequestRouter);

router.get('/:quoteId', async (req: Request, res: Response, next: NextFunction) => {
    try{
        const quoteId = req.params.quoteId;
        // console.log(quoteId);
        const { data: existQuotation, error: QuotationNotFoundError } = await supabase
            .from('Quotation')
            .select()
            .eq("Quote_id", quoteId)
            .single();

        if (QuotationNotFoundError) {
            return next(QuotationNotFoundError);
        }

        return existQuotation;
    }
    catch (error){
        return next(error);
    }



})



export default router;