import { Strategy, VerifyFunction} from 'passport-local';
import bcrypt from 'bcrypt';
import { Repository } from "typeorm";
import ownerRepository from "../../repository/OwnerRepository";
import forwarderRepository from "../../repository/ForwarderRepository";
import Owner from "../../domain/Owner";
import Forwarder from "../../domain/Forwarder";


const verifyLogin = (repository: Repository<Owner | Forwarder>): VerifyFunction => {
    return async (email: string, password: string, done: any) => {
        try {
            const existUser = await repository.findOneBy({
                email: email
            });

            if (existUser) {
                const result = await bcrypt.compare(password, existUser.password!);
                if (result) {
                    done(null, existUser, { status: 200, message: 'Success to login' });
                } else {
                    done(null, null, { status: 403, message: 'Wrong password' });
                }
            } else {
                done(null, null, { status: 400, message: 'User does not exist' });
            }
        } catch (error) {
            done(error);
        }
    }
};

const ownerStrategy = new Strategy({ usernameField: 'email', passwordField: 'password' }, verifyLogin(ownerRepository));
const forwarderStrategy = new Strategy({ usernameField: 'email', passwordField: 'password' }, verifyLogin(forwarderRepository));

export { ownerStrategy, forwarderStrategy };