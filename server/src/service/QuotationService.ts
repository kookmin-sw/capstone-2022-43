import quotationRepository from "../repository/QuotationRepository";
import Owner from "../domain/Owner";
import ownerRepository from "../repository/OwnerRepository";
import List from "../routes/requests/list";
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