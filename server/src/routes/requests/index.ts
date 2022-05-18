import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix, unixToDate } from "../../middlewares/timeConvert";
import QuoteRequest from '../../domain/Request';
import Goods from "../../domain/Goods";
import requestRepository from "../../repository/RequestRepository";
import goodsRepository from "../../repository/GoodsRepository";


const router = express.Router();

router.get('/', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { uuid } = req.decoded;

        const selected_requests = await requestRepository.find({
            select: ['trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at'],
            where: { owner_uuid: uuid }
        });

        selected_requests.forEach((request) => {
            dateToUnix(request, ['forwarding_date', 'closing_date', 'created_at']);
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
        const quote_request = req.body.quoteRequest as QuoteRequest;
        const goods_array = req.body.goodsRequests as Goods[];

        const insertRequest = async () => {
            quote_request.owner_uuid = uuid;
            unixToDate(quote_request, ["forwarding_date", "closing_date"]);
            return requestRepository.save(quote_request);
        };

        const created_request = await insertRequest();
        dateToUnix(created_request, ["forwarding_date", "closing_date", "created_at"]);

        const created_goods_array = await Promise.all(
             goods_array.map(async (goods: Goods) => {
                 goods.request_id = created_request.id!;
                const created_goods = await goodsRepository.save(goods);
                dateToUnix(created_goods, ["created_at"]);
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