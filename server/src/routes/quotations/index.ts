import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../utils/supabase';
import { isoToUnix, unixToIso } from "../../middlewares/timeConvert";
import {verifyForwarderToken} from "../../middlewares/verifyToken";
import PageNotFoundRouter from "../pageNotFoundRouter";


const router = express.Router();

router.get('/', verifyForwarderToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;

        const {data: quotation, error: FailToInsert } = await supabase
            .from('QUOTATION')
            .select(`id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at,
            forwarder:forwarder_uuid(name, phone_number, corporation_name, corporation_number),
            requests:request_id(id, trade_type, trade_detail, forwarding_date, departure_country, departure_detail,
                destination_country, destination_detail, incoterms, closing_date, created_at)`
            )
            .eq('forwarder_uuid', uuid);

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

router.post('/', verifyForwarderToken, async (req: Request, res: Response, next: NextFunction) => {
    try {

        const forwarder_uuid = req.decoded.uuid;
        console.log(forwarder_uuid + req.decoded.role);

        unixToIso(req.body, ["estimated_time"]);
        const {ocean_freight_price, inland_freight_price, total_price ,estimated_time, request_id} = req.body;

        const {data: quotation, error: FailToInsert} = await supabase
            .from('QUOTATION')
            .insert({ forwarder_uuid, ocean_freight_price, inland_freight_price, total_price ,estimated_time, request_id })
            .select(`id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at,
            forwarder:forwarder_uuid(name, phone_number, corporation_name, corporation_number),
            requests:request_id(id, trade_type, trade_detail, forwarding_date, departure_country, departure_detail,
                destination_country, destination_detail, incoterms, closing_date, created_at)`
            )

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

        if (quotation === null && selected_goods_array.length === 0) {
            return PageNotFoundRouter(req, res, next);
        }

        selected_goods_array.forEach((goods) => {
            isoToUnix(goods, ["created_at"]);
        });

        // isoToUnix(quotation, ["estimated_time", "created_at"]);
        return res.status(200).json({
            status: 200,
            message: 'Success to requests response',
            Quotation: quotation,
            Goods: selected_goods_array
        });
    } catch (error) {
        return next(error);
    }
});

export default router;