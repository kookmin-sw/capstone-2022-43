import express, { Request, Response, NextFunction } from "express";
import { supabase } from '../../../utils/supabase'

const router = express.Router();

router.post('/', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { email, password, name } = req.body;

        const { data, error } = await supabase
        .from('User')
        .insert({ email, password, name });

        // temporary error handler
        if (error) {
            return next(error);
        }

        return res.status(200).json({ ...data });
    } catch (error) {
        console.log(error);
        return next(error);
    }
});

export default router;