import express, { Request, Response, NextFunction } from "express";
import { supabase } from '../../../utils/supabase';
import requestIp from "request-ip";
import useragent from "useragent";
import logger from "../../../middlewares/logger";


const router = express.Router();

router.post('/', async (req: Request, res: Response, next: NextFunction) =>{
    try{
        const { id, HSCODE, COUNTRY } = req.body;
       // console.log(req.body);


        const { data: quotation, error: FailToInsert } = await supabase
            .from('Quotation')
            .insert({ id, HSCODE, COUNTRY });

        //console.log(quotation);
        // temporary error handler
        if (FailToInsert) {
            return next(FailToInsert);
        }
        //
        // const user = req.headers['user-agent'];
        // const userOS = useragent.parse(user).os.toString();
        // const userBrowser = useragent.parse(user).toAgent();
        // const ip = requestIp.getClientIp(req);
        //
        //
        // const userInfo : string = ` IP: ${ ip } OS : ${ userOS } Browser : ${ userBrowser }`
        // console.log(userInfo);
        // logger.info(req.baseUrl);
        return res.status(200).json({ message: 'Success to quote' });
    }
    catch (error){
        console.log(error);
        return next(error);
    }
});

export default router;