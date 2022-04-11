import express, { Request, Response, NextFunction } from "express";
import { supabase } from '../../../utils/supabase';
import requestIp from "request-ip";
import useragent from "useragent";
import logger from "../../../middlewares/logger";


const router = express.Router();

router.post('/', async (req: Request, res: Response, next: NextFunction) =>{
    try{
        const { id, HSCODE, COUNTRY } = req.body;

        const { data: quotation, error: FailToInsert } = await supabase
            .from('Quotation')
            .insert({ id, HSCODE, COUNTRY });

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