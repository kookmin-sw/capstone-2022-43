import express, {Request, Response, NextFunction} from "express";
import {supabase} from "../../utils/supabase";


const router = express.Router();

router.get('/', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { role, owner_uuid, forwarder_uuid } = req.body;

        if (role == 'forwarder') {
            const {data: review, error: error} = await supabase
                .from('REVIEW')
                .select(`score, message,
                forwarder: forwarder_uuid(name, corporation_name), 
                owner: owner_uuid(name),          
                requests: request_id(id, trade_type, trade_detail, forwarding_date, departure_country, 
                          departure_detail, destination_country, destination_detail, incoterms, closing_date, created_at)
                quotation: quotation_id(id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at)`)
                .eq('forwarder_uuid', forwarder_uuid);
            if (error) {
                return next(error);
            }

            return res.status(200).json({
                status: 200,
                message: 'Success to find requests',
                Review: review
            });
        }
        const {data: review, error: error} = await supabase
            .from('REVIEW')
            .select(`score, message,
                forwarder: forwarder_uuid(name, corporation_name), 
                owner: owner_uuid(name),          
                requests: request_id(id, trade_type, trade_detail, forwarding_date, departure_country, 
                          departure_detail, destination_country, destination_detail, incoterms, closing_date, created_at)
                quotation: quotation_id(id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at)`)
            .eq('onwer_uuid', owner_uuid);
        if (error) {
            return next(error);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            Quotation: review
        });

    } catch (error) {
        return next(error);
    }

});
router.post('/', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { score, message, owner_uuid, forwarder_uuid, quotation_id, request_id } = req.body;
        const {data: review, error: FailtoInsert} = await supabase
            .from('REVIEW')
            .insert({ score, message, owner_uuid, forwarder_uuid, quotation_id, request_id });

        if (FailtoInsert) {
            return next(FailtoInsert);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to insert review',
        });

    } catch (error){
        return next(error);
    }
});

export default router;