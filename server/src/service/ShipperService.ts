import {supabase} from "../utils/supabase";
import ShipperRepository from "../repository/ShipperRepository";
import SupabaseShipperRepository from "../repository/SupabaseShipperRepository";

class ShipperService {
    private shipperRepository: ShipperRepository = new SupabaseShipperRepository();

    // constructor(shipperRepository: ShipperRepository) {
    //     this.shipperRepository = shipperRepository;
    // }


}

export default ShipperService;