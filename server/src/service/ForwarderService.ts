import forwarderRepository from "../repository/ForwarderRepository";
import Forwarder from "../domain/Forwarder";
import HttpException from "../exceptions/HttpException";


class OwnerService {
    public async checkDuplicated(email: string): Promise<void> {
        const forwarder = await forwarderRepository.findOneBy({
            email: email
        });
        if (forwarder) {
            throw new HttpException(400, 'Already exist user');
        }
    }

    public async join(forwarder: Forwarder): Promise<Forwarder> {
        await this.checkDuplicated(forwarder.email!);
        return await forwarderRepository.save(forwarder);
    }
}

export default OwnerService;