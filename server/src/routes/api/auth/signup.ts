import express, { Request, Response, NextFunction } from "express";
import { supabase } from "../../../utils/supabase";
import bcrypt from "bcrypt";
import HttpException from "../../../exceptions/HttpException";



const router = express.Router();

router.post('/signup', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { email, password, name, phone_number } = req.body;

        const { data: existUser, error: UserNotFoundError } = await supabase
        .from('OWNER')
        .select('email, password')
        .eq('email', email)
        .limit(1)
        .single();

        if (existUser) {
            return next(new HttpException(400, 'Already exist user'));
        }

        const hash = await bcrypt.hash(password, 14);

        const { data: newUser, error: FailToInsert } = await supabase
        .from('OWNER')
        .insert({ email, password: hash, name, phone_number });

        // temporary error handler
        if (FailToInsert) {
            return next(FailToInsert);
        }

        return res.status(200).json({
            status: 200,
            message: 'Success to sign up'
        });

    } catch (error) {
        return next(error);
    }
});

export default router;