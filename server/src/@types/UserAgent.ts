import useragent from 'useragent';
import requestIp from 'request-ip';
import { Request } from 'express';


class UserAgent {
    userOS: String;
    userBrowser: String;
    ip: String | null;

    constructor(req: Request) {
        this.userOS = useragent.parse(req.headers['user-agent']).os.toString();
        this.userBrowser = useragent.parse(req.headers['user-agent']).toAgent();
        this.ip = requestIp.getClientIp(req);
    }

    toString(){
        return `IP: ${ this.ip } OS: ${ this.userOS } Browser: ${ this.userBrowser }`;
    }
}

export default UserAgent;