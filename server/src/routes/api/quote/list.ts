import express, {Request, Response, NextFunction,} from 'express';
import { supabase } from '../../../utils/supabase';


const router = express.Router();

router.get('/list', async (req : Request, res : Response, next : NextFunction) => {
    try{
        const { data: existQuotation, error: QuotationNotFoundError } = await supabase
            .from('Quotation')
            .select();

        if (QuotationNotFoundError) {
            return next(QuotationNotFoundError);
        }

        return res.status(200).json({
            status: 200,
            quotations: existQuotation
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;