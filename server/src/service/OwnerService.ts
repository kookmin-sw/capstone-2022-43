import ownerRepository from "../repository/ownerRepository";
import { Owner } from "../domain";
import HttpException from "../exceptions/HttpException";


class OwnerService {
    public async checkDuplicated(email: string): Promise<void> {
        const owner = await ownerRepository.findOneBy({
            email: email
        });
        if (owner) {
            throw new HttpException(400, 'Already exist user');
        }
    }

    public async join(owner: Owner): Promise<Owner> {
        await this.checkDuplicated(owner.email);
        return await ownerRepository.save(owner);
    }
}

export default OwnerService;