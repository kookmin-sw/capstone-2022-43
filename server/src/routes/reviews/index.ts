import express, {Request, Response, NextFunction} from "express";
import {supabase} from "../../utils/supabase";
import {verifyAnyToken, verifyOwnerToken} from "../../middlewares/verifyToken";


const router = express.Router();

router.get('/', verifyAnyToken ,async (req: Request, res: Response, next: NextFunction) => {
    try {
        const role = req.decoded.role;
        const uuid = req.decoded.uuid;

            // { role, owner_uuid, forwarder_uuid } = req.body;

        if (role == 'forwarder') {
            const {data: review, error: error} = await supabase
                .from('REVIEW')
                .select(`score, message,
                forwarder: forwarder_uuid(name, corporation_name), 
                owner: owner_uuid(name),          
                requests: request_id(id, trade_type, trade_detail, forwarding_date, departure_country, 
                          departure_detail, destination_country, destination_detail, incoterms, closing_date, created_at)
                quotation: quotation_id(id, ocean_freight_price, inland_freight_price, total_price, estimated_time, created_at)`)
                .eq('forwarder_uuid', uuid);
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
            .eq('onwer_uuid', uuid);
        if (error) {
            return next(error);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to find reviews',
            Review: review
        });

    } catch (error) {
        return next(error);
    }

});
router.post('/',verifyOwnerToken ,async (req: Request, res: Response, next: NextFunction) => {
    try {
        const owner_uuid = req.decoded.uuid;
        const { score, message, quotation_id, request_id } = req.body;

        const {data: uuid, error: FailToFindFowarder_uuid} = await supabase
            .from('QUOTATION')
            .select('forwarder_uuid')
            .eq('id', quotation_id);

        if (FailToFindFowarder_uuid) {
            return next(FailToFindFowarder_uuid);
        }

        const forwarder_uuid = uuid[0]['forwarder_uuid'];

        const {data: review, error: FailtoInsert} = await supabase
            .from('REVIEW')
            .insert({ score, message, owner_uuid, forwarder_uuid, quotation_id, request_id });

        if (FailtoInsert) {
            return next(FailtoInsert);
        }

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