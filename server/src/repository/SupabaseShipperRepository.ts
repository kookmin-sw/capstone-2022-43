import Forwarder from "../domain/Forwarder";
import shipperRepository from "./ShipperRepository";
import {supabase} from "../utils/supabase";
import shipper from "../domain/Forwarder";

class SupabaseShipperRepository implements shipperRepository {
    findAll(): Forwarder[] {
        return [];
    }

    findById(id: String): Forwarder | undefined {
        return undefined;

    }

    save(shipper: Forwarder): Forwarder | undefined{
        return undefined;
    }

}

export default SupabaseShipperRepository;