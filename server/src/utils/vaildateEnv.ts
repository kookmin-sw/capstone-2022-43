import { cleanEnv, str, port, url } from 'envalid';


const validateForwarderEnv = () => {
    cleanEnv(process.env, {
        JWT_FORWARDER_SECRET: str(),
        PORT: port(),
        HSCODE_SERVER_HOST: url(),
        MYSQL_SERVER_HOST: str(),
        MYSQL_SERVER_PORT: port(),
        MYSQL_SERVER_USER: str(),
        MYSQL_SERVER_PASSWORD: str(),
        MYSQL_SERVER_DATABASE: str(),
        ADMIN_PAGE_COOKIE: str(),
    });
};

export default validateForwarderEnv;