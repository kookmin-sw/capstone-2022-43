import { supabase } from "../utils/supabase";
import Owner from "../domain/owner";
import HttpException from "../exceptions/HttpException";


class OwnerService {
    public async checkDuplicated(email: String) {
        const { data: existUser, error: UserNotFoundError } = await supabase
            .from('OWNER')
            .select('email, password')
            .eq('email', email)
            .limit(1)
            .single();

        if (existUser) {
            throw new HttpException(400, 'Already exist user');
        }
    }

    public async join(owner: Owner) {
        const checkDuplicated = await this.checkDuplicated(owner.email);
        const { data: newUser, error: FailToInsert } = await supabase
            .from('OWNER')
            .insert(owner);

        // .insert({name: owner.name, password: owner.pwd, email: owner.email, phone_number: owner.phone})
        // .single();

        // temporary error handler
        if (FailToInsert) {
            throw FailToInsert;
        }
        // this.shipperRepository.save(owner);
    }
}

export default OwnerService;