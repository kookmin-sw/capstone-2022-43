import express, {Request, Response, NextFunction,} from 'express';
import { supabase } from '../../utils/supabase';
import {isoToUnix} from "../../middlewares/timeConvert";


const router = express.Router();

router.get('/list', async (req : Request, res : Response, next : NextFunction) => {
    try {
        const { data: existRequests, error: QuotationNotFoundError } = await supabase
            .from('REQUEST')
            .select('id, trade_type, trade_detail, forwarding_date, departure_country, departure_detail,' +
                'destination_country, destination_detail, incoterms, closing_date, created_at');

        if (QuotationNotFoundError) {
            return next(QuotationNotFoundError);
        }

        existRequests.forEach((selected_request) => {
            isoToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequests: existRequests
        });
    }
    catch (error) {
        return next(error);
    }
});

export default router;