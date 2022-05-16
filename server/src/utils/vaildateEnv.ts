import { cleanEnv, str, port, url } from 'envalid';


const validateForwarderEnv = () => {
    cleanEnv(process.env, {
        PUBLIC_SUPABASE_URL: str(),
        PUBLIC_SUPABASE_KEY: str(),
        JWT_FORWARDER_SECRET: str(),
        PORT: port(),
        HSCODE_SERVER_HOST: url(),
        MYSQL_SERVER_HOST: str(),
        MYSQL_SERVER_PORT: port(),
        MYSQL_SERVER_USER: str(),
        MYSQL_SERVER_PASSWORD: str(),
        MYSQL_SERVER_DATABASE: str(),
    });
};

export default validateForwarderEnv;