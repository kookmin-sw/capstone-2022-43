import Shipper from "../domain/Shipper";

interface ShipperRepository {
    save(shipper: Shipper): Shipper | undefined;
    findById?(id: String): Shipper | undefined;
    findAll(): Shipper[] | undefined;
}

export default ShipperRepository;