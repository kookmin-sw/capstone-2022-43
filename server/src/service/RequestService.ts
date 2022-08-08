import QuoteRequest from "../domain/Request";
import {dateToUnix, unixToDate} from "../middlewares/timeConvert";
import requestRepository from "../repository/RequestRepository";

class RequestService {

    public async saveRequest(request: QuoteRequest): Promise<QuoteRequest> {
        return await requestRepository.save(request);

    }

    public async findRequests(uuid?: string | undefined): Promise<QuoteRequest[]>  {
        let requests: QuoteRequest[];
        if(typeof uuid === 'string'){
            requests = await requestRepository.find({
                where: { owner_uuid: uuid }
            });
        }else{
            requests = await requestRepository.find();
        }

        return requests;
    }
}

export default RequestService