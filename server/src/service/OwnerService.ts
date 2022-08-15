import ownerRepository from "../repository/OwnerRepository";
import Owner from "../domain/Owner";
import HttpException from "../exceptions/HttpException";


class OwnerService {
    public async checkDuplicated(email: string): Promise<void> {
        const owner = await ownerRepository.findOneBy({
            email: email
        });
        if (owner) {
            throw new HttpException(400, 'Already exist users');
        }
    }

    public async join(owner: Owner): Promise<Owner> {
        await this.checkDuplicated(owner.email!);
        return await ownerRepository.save(owner);
    }
}

export default OwnerService;