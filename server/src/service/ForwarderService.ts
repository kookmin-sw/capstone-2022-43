import {supabase} from "../utils/supabase";
import ShipperRepository from "../repository/ShipperRepository";
import SupabaseShipperRepository from "../repository/SupabaseShipperRepository";
import Forwarder from "../domain/Forwarder";
import HttpException from "../exceptions/HttpException";
import forwarder from "../domain/Forwarder";
import NextFunction from "express";
import {rejects} from "assert";

class ForwarderService {
    public static shipperRepository: ShipperRepository = new SupabaseShipperRepository();


    public async checkDuplicated(email: String) {
        /*
         체크하고
         if (existUser) {
                    return next(new HttpException(400, 'Already exist user'));
                }
          이부분까지 작성하면 될 것 같습니다.
         */
        const {data: existUser, error: UserNotFoundError} = await supabase
            .from('FORWARDER')
            .select('email, password')
            .eq('email', email)
            .limit(1)
            .single();

        if (existUser) {
            throw new HttpException(400, 'Already exist user');

            // rejects(new HttpException(400, 'Already exist user'));
        }
    }

    public async join(forwarder: Forwarder) {
        const tmp = await this.checkDuplicated(forwarder.email);
        const {data: newUser, error: FailToInsert} = await supabase
            .from('FORWARDER')
            .insert(forwarder);

            // .insert({name: forwarder.name, password: forwarder.pwd, email: forwarder.email, phone_number: forwarder.phone})
            // .single();

        // temporary error handler
        if (FailToInsert) {
            throw FailToInsert;
        }
        // this.shipperRepository.save(forwarder);
    }
}

export default ForwarderService;