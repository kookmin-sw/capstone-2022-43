import { Strategy } from 'passport-local';
import bcrypt from 'bcrypt';
import { supabase } from '../supabase';


const verifyLogin = async (email: string, password: string, done: any) => {
    try {
        const { data: existUser, error } = await supabase
        .from('User')
        .select('uuid, email, password, name')
        .eq('email', email)
        .limit(1)
        .single();

        if (existUser) {
            const result = await bcrypt.compare(password, existUser.password);
            if (result) {
                done(null, existUser, { message: 'Success to login' });
            } else {
                done(null, null, { message: 'Wrong password' });
            }
        } else {
            done(null, null, { message: 'User does not exist' });
        }
    } catch (error) {
        console.log(error);
        done(error);
    }
}

const localStrategy = new Strategy({ usernameField: 'email', passwordField: 'password' }, verifyLogin);

export default localStrategy;