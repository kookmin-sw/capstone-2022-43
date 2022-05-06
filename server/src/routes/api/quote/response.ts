import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../../utils/supabase';


const router = express.Router();

router.post('/response', async (req: Request, res: Response, next: NextFunction) =>{
    try{
        const { QUOTATION_KEY, FORWARDER_ID, LANDCHARGE, OCEANCHARGE, DURATION } = req.body;

        const { data: quotation, error: FailToInsert } = await supabase
            .from('Quotation1')
            .insert({ QUOTATION_KEY, FORWARDER_ID, LANDCHARGE, OCEANCHARGE, DURATION });

        if (FailToInsert) {
            return next(FailToInsert);
        }

        return res.status(200).json({ message: 'Success to quote response' });
    }
    catch (error){
        return next(error);
    }
});

export default router;