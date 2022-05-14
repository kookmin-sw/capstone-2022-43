import { cleanEnv, str, port, url } from 'envalid';


const validateForwarderEnv = () => {
    cleanEnv(process.env, {
        PUBLIC_SUPABASE_URL: str(),
        PUBLIC_SUPABASE_KEY: str(),
        JWT_FORWARDER_SECRET: str(),
        PORT: port(),
        HSCODE_SERVER_HOST: url(),
    });
}

export default validateForwarderEnv;