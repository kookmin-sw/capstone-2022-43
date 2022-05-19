import express, { Request, Response, NextFunction } from "express";
import { verifyAnyToken, verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix } from "../../middlewares/timeConvert";
import quotationRepository from "../../repository/QuotationRepository";
import reviewRepository from "../../repository/ReviewRepository";
import Owner from "../../domain/Owner";
import Forwarder from "../../domain/Forwarder";
import Quotation from "../../domain/Quotation";
import QuoteRequest from '../../domain/Request';
import forwarderRepository from "../../repository/ForwarderRepository";
import requestRepository from "../../repository/RequestRepository";
import ownerRepository from "../../repository/OwnerRepository";
import reviews from "../reviews";
import printLog from "../../middlewares/printLog";


const router = express.Router();

router.get('/', verifyAnyToken ,async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { role, uuid } = req.decoded;
        const where = `R.${role}_uuid = :uuid`;
        // const column = `${role}_uuid`;

        // const reviews = await reviewRepository.find({
        //     select: ['score', 'message', 'owner_uuid', 'forwarder_uuid', 'request_id', 'quotation_id'],
        //     where: { [column]: uuid }
        // });

        const reviews = await reviewRepository.createQueryBuilder('R')
        .leftJoinAndSelect('R.forwarder', 'F')
        .leftJoinAndSelect('R.owner', 'O')
        .leftJoinAndSelect('R.requests', 'E')
        .leftJoinAndSelect('R.quotation', 'Q')
        .select(['R.score', 'R.message',
            'O.name', 'F.name',  'F.corporation_name',
            'E.id', 'E.trade_type', 'E.trade_detail', 'E.forwarding_date', 'E.departure_country', 'E.departure_detail',
            'E.destination_country', 'E.destination_detail', 'E.incoterms', 'E.closing_date', 'E.created_at',
            'Q.id', 'Q.ocean_freight_price', 'Q.inland_freight_price', 'Q.total_price', 'Q.estimated_time', 'Q.created_at'])
        .where(where, { uuid })
        .getMany();

        reviews.forEach((review) => {
            dateToUnix(review!.requests, ['forwarding_date', 'closing_date', 'created_at']);
            dateToUnix(review!.quotation, ['estimated_time', 'created_at'])
        });

        res.status(200).json({
            status: 200,
            message: 'Success to find quotation',
            Review: reviews,
            selectedGoods: []
        });
        return printLog(req, res);
    } catch (error) {
        return next(error);
    }

});
router.post('/',verifyOwnerToken ,async (req: Request, res: Response, next: NextFunction) => {
    try {
        const owner_uuid = req.decoded.uuid;
        const { score, message, quotation_id, request_id } = req.body;

        const { forwarder_uuid } = await quotationRepository.findOne({
            select: ['forwarder_uuid'],
            where: { id: quotation_id }
        }) as Quotation;

        const review = await reviewRepository.save({ message, owner_uuid, forwarder_uuid, quotation_id, request_id })
        review.owner = new Owner();
        review.forwarder = new Forwarder();
        review.requests = new QuoteRequest();
        review.quotation = new Quotation();

        dateToUnix(review, ['created_at'])


        // const [ forwarder, owner ,request, quotation ] = await Promise.all([
        //     forwarderRepository.findOne({
        //         select: ['name', 'corporation_name'],
        //         where: { uuid: forwarder_uuid }
        //     }),
        //     ownerRepository.findOne({
        //         select: ['name'],
        //         where: { uuid: review.owner_uuid }
        //     }),
        //
        //     requestRepository.findOne({
        //         select: ['id', 'trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
        //             'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at'],
        //         where: { id: review.request_id }
        //     }),
        //     quotationRepository.findOne(({
        //         select: ['id', 'ocean_freight_price', 'inland_freight_price', 'total_price', 'estimated_time', 'created_at'],
        //         where: { id: review.quotation_id}
        //     }))
        // ]);
        //
        //
        // review.forEach((r) => {
        //     dateToUnix(r, ['estimated_time', 'created_at']);
        //     dateToUnix(r!.request, ['forwarding_date', 'closing_date', 'created_at']);
        //     dateToUnix(r!.quotation, ['Q.estimated_time', 'Q.created_at'])
        // });

        res.status(200).json({
            status: 200,
            message: 'Success to insert review',
            Review: [review]
        });
        return printLog(req, res);
    } catch (error){
        return next(error);
    }
});

export default router;