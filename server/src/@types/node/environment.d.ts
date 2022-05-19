import { num, port, str, url } from "envalid";


declare global {
    namespace NodeJS {
        interface ProcessEnv {
            NODE_ENV: string,
            PORT: string;
            JWT_OWNER_SECRET: string,
            JWT_FORWARDER_SECRET: string,
            HSCODE_SERVER_HOST: string,
            MYSQL_SERVER_HOST: string,
            MYSQL_SERVER_USER: string,
            MYSQL_SERVER_PASSWORD: string,
            MYSQL_SERVER_PORT: number,
            MYSQL_SERVER_DATABASE: string,
        }
    }
}

export {};