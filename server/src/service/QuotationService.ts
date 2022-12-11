import quotationRepository from "../repository/QuotationRepository";
import Quotation from "../domain/Quotation";

class QuotationService {

    public async getInfo(id: number | string): Promise<Quotation[]>{
        if(typeof id === "number"){
            return await quotationRepository.find({
                where: [
                    {request_id: id}
                ]
            });
        }
        return await quotationRepository.find({
            where: [
                {forwarder_uuid: id}
            ]
        });
    }

}

export default QuotationService;