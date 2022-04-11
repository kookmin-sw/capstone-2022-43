import useragent from "useragent";
import requestIp from "request-ip";
import {Request} from "express";

class UserInfo  {
    req : Request;

    constructor(req : Request) {
        this.req = req;
    }

    toString(){
        const user = this.req.headers['user-agent'];
        const userOS = useragent.parse(user).os.toString();
        const userBrowser = useragent.parse(user).toAgent();
        const ip = requestIp.getClientIp(this.req);
        return ` IP: ${ ip } OS : ${ userOS } Browser : ${ userBrowser }`
    }

}

export default UserInfo;