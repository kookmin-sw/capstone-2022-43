import express, { Request, Response, NextFunction } from "express";
import { supabase } from '../../../utils/supabase';


const router = express.Router();

router.post('/request', async (req: Request, res: Response, next: NextFunction) =>{
    try{
        const { id, HSCODE, COUNTRY } = req.body;

        const { data: quotation, error: FailToInsert } = await supabase
            .from('Quotation')
            .insert({ id, HSCODE, COUNTRY });

        // temporary error handler
        if (FailToInsert) {
            return next(FailToInsert);
        }

        return res.status(200).json({ message: 'Success to quote' });
    }
    catch (error){
        return next(error);
    }
});

export default router;