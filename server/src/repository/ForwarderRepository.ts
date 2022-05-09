import Forwarder from "../domain/Forwarder";
import Shipper from "../domain/Shipper";

interface ForwarderRepository {
    save(forwarder: Forwarder): Forwarder;
    findById?(id: String): Forwarder;
    findAll(): Forwarder[];
}

export default ForwarderRepository;