import express, {Request, Response, NextFunction} from "express";
import {verifyAnyToken, verifyOwnerToken} from "../../middlewares/verifyToken";
import {dateToUnix} from "../../middlewares/timeConvert";
import quotationRepository from "../../repository/QuotationRepository";
import reviewRepository from "../../repository/ReviewRepository";
import Quotation from "../../domain/Quotation";
import forwarderRepository from "../../repository/ForwarderRepository";
import requestRepository from "../../repository/RequestRepository";
import ownerRepository from "../../repository/OwnerRepository";


const router = express.Router();

router.get('/', verifyAnyToken ,async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { role, uuid } = req.decoded;
        const where = `R.${role}_uuid = :uuid`;

        const reviews = await reviewRepository.createQueryBuilder('R')
        .leftJoinAndSelect('R.forwarder', 'F')
        .leftJoinAndSelect('R.owner', 'O')
        .leftJoinAndSelect('R.request', 'E')
        .leftJoinAndSelect('R.quotation', 'Q')
        .select(['R.score', 'R.message',
            'F.name',  'F.corporation_name', 'O.name',
            'R.id', 'E.trade_type', 'E.trade_detail', 'E.forwarding_date', 'E.departure_country', 'E.departure_detail',
            'E.destination_country', 'E.destination_detail', 'E.incoterms', 'E.closing_date', 'E.created_at'])
        .where('R.owner_uuid = :uuid', { uuid })
        .getMany();

        reviews.forEach((review) => {
            dateToUnix(review!.request, ['forwarding_date', 'closing_date', 'created_at']);
            dateToUnix(review!.quotation, ['estimated_time', 'created_at'])
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find quotation',
            Review: reviews,
            selectedGoods: []
        });

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

        return res.status(200).json({
            status: 200,
            message: 'Success to insert review',
            Review: review
        });

    } catch (error){
        return next(error);
    }
});

export default router;