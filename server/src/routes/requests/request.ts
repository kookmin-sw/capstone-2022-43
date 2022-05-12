import express, { Request, Response, NextFunction } from 'express';
import { supabase } from '../../utils/supabase';


const router = express.Router();

router.post('/request', async (req: Request, res: Response, next: NextFunction) =>{
    try{
        const { id, hscode, country } = req.body;

        const { data: quotation, error: FailToInsert } = await supabase
            .from('Quotation')
            .insert({ id, hscode, country });

        if (FailToInsert) {
            return next(FailToInsert);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to requests'
        });
    }
    catch (error){
        return next(error);
    }
});

export default router;