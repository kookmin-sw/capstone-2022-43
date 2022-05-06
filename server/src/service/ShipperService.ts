import {supabase} from "../utils/supabase";
import ShipperRepository from "../repository/ShipperRepository";
import SupabaseShipperRepository from "../repository/SupabaseShipperRepository";
import Shipper from "../domain/Shipper";

class ShipperService {
    public static shipperRepository: ShipperRepository = new SupabaseShipperRepository();

    public checkDuplicated(id: String){

    }
    static checkDupliated(id: String) {
        /*
         체크하고
         if (existUser) {
                    return next(new HttpException(400, 'Already exist user'));
                }
          이부분까지 작성하면 될 것 같습니다.
         */
    }

    static join(shipper: Shipper) {
        this.shipperRepository.save(shipper);
    }
}

export default ShipperService;