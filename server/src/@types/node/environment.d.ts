declare global {
    namespace NodeJS {
        interface ProcessEnv {
            NODE_ENV: string,
            PORT: string;
            PUBLIC_SUPABASE_URL: string,
            PUBLIC_SUPABASE_KEY: string,
            JWT_SECRET: string,
            HSCODE_SERVER_HOST: string,
        }
    }
}

export {}