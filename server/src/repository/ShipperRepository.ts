import Forwarder from "../domain/Forwarder";

interface ShipperRepository {
    save(shipper: Forwarder): Forwarder | undefined;
    findById?(id: String): Forwarder | undefined;
    findAll(): Forwarder[] | undefined;
}

export default ShipperRepository;