import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../utils/supabase';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import { isoToUnix, unixToIso } from "../../middlewares/timeConvert";


const router = express.Router();

router.post('/response', verifyOwnerToken, async (req: Request, res: Response, next: NextFunction) => {
    try {

        const forwarder_uuid = req.decoded.uuid;

        unixToIso(req.body, ["estimated_time"]);
        const { ocean_freight_price, inland_freight_price, total_price ,estimated_time, request_id } = req.body;

        const { data: quotation, error: FailToInsert } = await supabase
            .from('QUOTATION')
            .insert({ forwarder_uuid,ocean_freight_price, inland_freight_price, total_price ,estimated_time, request_id });

        if (FailToInsert) {
            return next(FailToInsert);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to requests response',
            Quotation: quotation
        });
    } catch (error) {
        return next(error);
    }
});

export default router;