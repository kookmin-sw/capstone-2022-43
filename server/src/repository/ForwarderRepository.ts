import Forwarder from "../domain/Forwarder";


interface ForwarderRepository {
    save(forwarder: Forwarder): Forwarder;
    findById?(id: String): Forwarder;
    findAll(): Forwarder[];
}

export default ForwarderRepository;