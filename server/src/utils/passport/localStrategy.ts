import { Strategy } from 'passport-local';
import bcrypt from 'bcrypt';
import { supabase } from '../supabase';


const verifyLogin = async (email: string, password: string, done: any) => {
    try {
        const { data: existUser, error } = await supabase
        .from('OWNER')
        .select('uuid, email, password, name, phone_number')
        .eq('email', email)
        .limit(1)
        .single();

        if (existUser) {
            const result = await bcrypt.compare(password, existUser.password);
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

const localStrategy = new Strategy({ usernameField: 'email', passwordField: 'password' }, verifyLogin);

export default localStrategy;