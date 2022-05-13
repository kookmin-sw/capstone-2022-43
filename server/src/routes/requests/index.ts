import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../utils/supabase';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import insertGoods from "../../middlewares/insertGoods";
import { isoToUnix, unixToIso } from "../../middlewares/timeConvert";


const router = express.Router();

router.get('/', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;

        const { data: selected_requests, error: FailToFind } = await supabase
            .from('REQUEST')
            .select('id, trade_type, trade_detail, forwarding_date, departure_country, departure_detail,' +
                'destination_country, destination_detail, incoterms, closing_date, created_at')
            .eq('owner_uuid', uuid);

        if (FailToFind) {
            return next(FailToFind);
        }

        selected_requests.forEach((selected_request) => {
            isoToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequests: selected_requests
        });
    }
    catch (error){
        return next(error);
    }
});


router.post('/', verifyOwnerToken, async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;
        const quote_request: any = req.body.quoteRequest;
        const goods_array: any[] = req.body.goodsRequests;

        const insertRequest = async () => {
            quote_request.owner_uuid = uuid;
            unixToIso(quote_request, ["forwarding_date", "closing_date"]);
            return supabase.from('REQUEST').insert(quote_request).single();
        };
        const { data: created_request, error: FailToRequest } = await insertRequest();
        delete created_request.owner_uuid;

        if (FailToRequest) {
            return next(FailToRequest);
        }

        isoToUnix(created_request, ["forwarding_date", "closing_date", "created_at"]);

        const created_goods_array = await Promise.all(
             goods_array.map(async (goods: any) => {
                // @ts-ignore
                const created_goods = await insertGoods(created_request.id, goods);
                // @ts-ignore
                delete created_goods.owner_id;
                 // @ts-ignore
                isoToUnix(created_goods, ["created_at"]);
                return created_goods;
            })
        );

        return res.status(200).json({
            status: 200,
            message: 'Success to quote_request',
            createdRequest: created_request,
            createdGoods: created_goods_array
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;