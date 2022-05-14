import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../utils/supabase';
import PageNotFoundRouter from "../pageNotFoundRouter";
import { isoToUnix } from "../../middlewares/timeConvert";
import {verifyAnyToken} from "../../middlewares/verifyToken";


const router = express.Router();

router.get('/:id', verifyAnyToken ,async (req: Request, res: Response, next: NextFunction) =>{
    try {
        const { uuid } = req.decoded;
        const quotation_id = req.params.id;

        const {data: quotation, error: FailToFind } = await supabase
            .from('QUOTATION')
            .select(`id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at,
            forwarder:forwarder_uuid(name, phone_number, corporation_name, corporation_number),
            requests:request_id(id, trade_type, trade_detail, forwarding_date, departure_country, departure_detail,
                destination_country, destination_detail, incoterms, closing_date, created_at)`
            )
            .eq('id', quotation_id);


        if (FailToFind) {
            return next(FailToFind);
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

        if (quotation === null && selected_goods_array.length === 0) {
            return PageNotFoundRouter(req, res, next);
        }

        selected_goods_array.forEach((goods) => {
            isoToUnix(goods, ["created_at"]);
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequest: quotation,
            selectedGoods: selected_goods_array
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;