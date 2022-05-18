import express, { Request, Response, NextFunction } from 'express';
import { verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix } from "../../middlewares/timeConvert";
import requestRepository from "../../repository/RequestRepository";
import goodsRepository from "../../repository/GoodsRepository";
import quotationRepository from "../../repository/QuotationRepository";


const router = express.Router();

router.get('/:id', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) =>{
    try {
        const request_id = Number(req.params.id);

        const selected_request = await requestRepository.findOne({
            select: ['trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at'],
            where: { id: request_id }
        });
        dateToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);

        const selected_goods_array = await goodsRepository.find({
            select: ['id', 'name', 'price', 'weight', 'standard_unit', 'hscode', 'created_at'],
            where: { request_id }
        });

        selected_goods_array.forEach((goods) => {
            dateToUnix(goods, ["created_at"]);
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find request',
            selectedRequest: selected_request,
            selectedGoods: selected_goods_array
        });
    }
    catch (error) {
        return next(error);
    }
});

router.get('/:id/quotations', verifyOwnerToken , async (req: Request, res: Response, next: NextFunction) => {
    try {
        const request_id = Number(req.params.id);

        const quotations = await quotationRepository.createQueryBuilder('Q')
        .leftJoinAndSelect('Q.forwarder', 'F')
        .select(['Q.id', 'Q.ocean_freight_price', 'Q.inland_freight_price', 'Q.total_price', 'Q.estimated_time', 'Q.created_at',
            'F.name', 'F.phone_number', 'F.corporation_name', 'F.corporation_number'])
        .where('Q.request_id = :id', { id: request_id })
        .getMany();

        quotations.forEach((quotation) => {
            dateToUnix(quotation, ['estimated_time', 'created_at'])
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find quotations',
            Quotation: quotations,
            selectedGoods: []
        });
    } catch (error) {
        return next(error)
    }
});

export default router;