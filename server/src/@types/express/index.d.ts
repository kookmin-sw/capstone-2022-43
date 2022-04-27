import { JwtPayload } from 'jsonwebtoken';


declare global {
    namespace Express {
        interface Request {
            decoded?: string | JwtPayload
        }
        interface Response {}
        interface Application {}
    }
}
