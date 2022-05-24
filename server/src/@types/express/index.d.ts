import Decoded from "../../interfaces/DecodedToken";


declare global {
    namespace Express {
        interface Request {
            decoded: Decoded
        }
        interface Response {}
        interface Application {}
    }
}
