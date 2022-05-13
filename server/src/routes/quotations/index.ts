import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../utils/supabase';
import verifyToken from "../../middlewares/verifyToken";
import insertGoods from "../../middlewares/insertGoods";
import { isoToUnix, unixToIso } from "../../middlewares/timeConvert";


const router = express.Router();

router.get('/', async (req: Request, res: Response, next: NextFunction) => {
    try {
        // const { uuid } = req.decoded;
        const { forwarder_uuid } = req.body
        const {data: quotation, error: FailToInsert } = await supabase
            .from('QUOTATION')
            .select(`id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at,
            forwarder:forwarder_uuid(name, phone_number, corporation_name, corporation_number),
            requests:request_id(id, trade_type, trade_detail, forwarding_date, departure_country, departure_detail,
                destination_country, destination_detail, incoterms, closing_date, created_at)`
            )
            .eq('forwarder_uuid', forwarder_uuid);

        if (FailToInsert) {
            return next(FailToInsert);
        }

        let quoteId;
        quotation.forEach(selected_request => {
            quoteId = selected_request['requests']['id'] ;
            isoToUnix(selected_request, ["estimated_time", "created_at"]);
            isoToUnix(selected_request['requests'], ["forwarding_date", "closing_date", "created_at"]);
        });

        const { data: selected_goods_array, error: FailToFindGoods } = await supabase
            .from('GOODS')
            .select('id, name, price, weight, standard_unit, hscode, created_at')
            .eq('request_id', quoteId);

        if (FailToFindGoods) {
            return next(FailToFindGoods);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            Quotation: quotation,
            selectedGoods: selected_goods_array
        });
    }
    catch (error){
        return next(error);
    }
});

router.post('/', async (req: Request, res: Response, next: NextFunction) => {
    try {

        const { forwarder_uuid }= req.body;

        unixToIso(req.body, ["estimated_time"]);
        const {ocean_freight_price, inland_freight_price, total_price ,estimated_time, request_id} = req.body;

        const {data: quotation, error: FailToInsert} = await supabase
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