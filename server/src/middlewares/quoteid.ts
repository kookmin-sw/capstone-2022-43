import { Request, Response, NextFunction } from "express";
import {supabase} from "../utils/supabase";

const quotation = async (req: Request, res: Response, next: NextFunction) => {
    try{
        const quoteId = req.params.quoteId;
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
}

export default quotation;