import Shipper from "../domain/Shipper";
import shipperRepository from "./ShipperRepository";
import {supabase} from "../utils/supabase";
import shipper from "../domain/Shipper";

class SupabaseShipperRepository implements shipperRepository {
    findAll(): Shipper[] {
        return [];
    }

    findById(id: String): Shipper | undefined {
        return undefined;

    }

    save(shipper: Shipper): Shipper | undefined{
        return undefined;
    }

}

export default SupabaseShipperRepository;