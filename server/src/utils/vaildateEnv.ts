import { cleanEnv, str, port } from 'envalid';

const validateEnv = () => {
    cleanEnv(process.env, {
        PUBLIC_SUPABASE_URL: str(),
        PUBLIC_SUPABASE_KEY: str(),
        JWT_SECRET: str(),
        PORT: port(),
    });
}

export default validateEnv