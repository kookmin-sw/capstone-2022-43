import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../../utils/supabase';
import verifyToken from "../../../middlewares/verifyToken";
import PageNotFoundRouter from "../../pageNotFoundRouter";
import { isoToUnix } from "../../../middlewares/timeConvert";


const router = express.Router();

router.get('/:id', verifyToken , async (req: Request, res: Response, next: NextFunction) =>{
    try {
        const { uuid } = req.decoded;
        const request_id = req.params.id;

        const { data: selected_request, error: FailToFindRequest } = await supabase
            .from('REQUEST')
            .select('trade_type, trade_detail, forwarding_date, departure_country, departure_detail,' +
                'destination_country, destination_detail, incoterms, closing_date, created_at')
            .eq('id', request_id)
            .single();

        if (FailToFindRequest) {
            return next(FailToFindRequest);
        }

        const { data: selected_goods_array, error: FailToFindGoods } = await supabase
        .from('GOODS')
        .select('id, name, price, weight, standard_unit, hscode, created_at')
        .eq('request_id', request_id);

        if (FailToFindGoods) {
            return next(FailToFindGoods);
        }

        if (selected_request === null && selected_goods_array.length === 0) {
            return PageNotFoundRouter(req, res, next);
        }

        isoToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);
        selected_goods_array.forEach((goods) => {
            isoToUnix(goods, ["created_at"]);
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequest: selected_request,
            selectedGoods: selected_goods_array
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;