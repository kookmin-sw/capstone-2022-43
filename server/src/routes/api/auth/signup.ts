import express, { Request, Response, NextFunction } from "express";
import { supabase } from "../../../utils/supabase";
import bcrypt from "bcrypt";
import HttpException from "../../../exceptions/HttpException";



const router = express.Router();

router.post('/signup', async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { email, password, name } = req.body;

        const { data: existUser, error: UserNotFoundError } = await supabase
        .from('User')
        .select('email, password')
        .eq('email', email)
        .limit(1)
        .single();

        if (existUser) {
            return next(new HttpException(400, 'Already exist user'));
        }

        const hash = await bcrypt.hash(password, 14);

        const { data: newUser, error: FailToInsert } = await supabase
        .from('User')
        .insert({ email, password: hash, name });

        // temporary error handler
        if (FailToInsert) {
            return next(FailToInsert);
        }

        return res.status(200).json({ message: 'Success to sign up' });

    } catch (error) {
        console.log(error);
        return next(error);
    }
});

export default router;