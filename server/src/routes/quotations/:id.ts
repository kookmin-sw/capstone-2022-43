import express, { Request, Response, NextFunction } from 'express';
import { dateToUnix } from "../../middlewares/timeConvert";
import { verifyAnyToken } from "../../middlewares/verifyToken";
import quotationRepository from "../../repository/QuotationRepository";
import goodsRepository from "../../repository/GoodsRepository";


const router = express.Router();

router.get('/:id', verifyAnyToken ,async (req: Request, res: Response, next: NextFunction) =>{
    try {
        const quotation_id = Number(req.params.id);

        const quotation = await quotationRepository.createQueryBuilder('Q')
        .leftJoinAndSelect('Q.forwarder', 'F')
        .leftJoinAndSelect('Q.request', 'R')
        .select(['Q.ocean_freight_price', 'Q.inland_freight_price', 'Q.total_price', 'Q.estimated_time', 'Q.created_at',
            'F.name', 'F.phone_number', 'F.corporation_name', 'F.corporation_number',
            'R.id', 'R.trade_type', 'R.trade_detail', 'R.forwarding_date', 'R.departure_country', 'R.departure_detail',
            'R.destination_country', 'R.destination_detail', 'R.incoterms', 'R.closing_date', 'R.created_at'])
        .where('Q.id = :id', { id: quotation_id })
        .getOne();

        const selected_goods_array = await goodsRepository.find({
            select: ['id', 'name', 'price', 'weight', 'standard_unit', 'hscode', 'created_at'],
            where: { request_id: quotation!.requests!.id }
        });

        selected_goods_array.forEach((goods) => {
            dateToUnix(goods, ['created_at']);
        });
        dateToUnix(quotation!.requests, ['forwarding_date', 'closing_date', 'created_at']);
        dateToUnix(quotation, ['estimated_time', 'created_at']);

        return res.status(200).json({
            status: 200,
            message: 'Success to find quotation',
            Quotation: [quotation],
            selectedGoods: selected_goods_array
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;