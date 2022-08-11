import {NextFunction, Request, Response} from "express";
import quotationRepository from "../repository/QuotationRepository";
import printLog from "../middlewares/printLog";
import QuotationService from "../service/QuotationService";
import Quotation from "../domain/Quotation";

class QuotationController {

    private quotationService: QuotationService = new QuotationService();

    public registerQuote = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const uuid = req.decoded.uuid;

            const reqQuotation = req.body as Quotation;
            reqQuotation.forwarder_uuid = uuid;

            await quotationRepository.save(reqQuotation);

            res.status(200).json({
                message: 'Success to insert quotation',

            });
            return printLog(req, res);
        } catch (error) {
            return next(error);
        }

    }


    public getQuotation =  async (req: Request, res: Response, next: NextFunction) => {

        try {
            const { uuid } = req.decoded;

            const quotations = await this.quotationService.getInfo(uuid);

            res.status(200).json({
                message: 'Success to find quotation',
                result: quotations
            });
            return printLog(req, res);
            }
            catch (error){
                return next(error);
            }
    };

    public getQuotationbyId = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const request_id = Number(req.params.id);

            const quotations = await this.quotationService.getInfo(request_id);
            if (quotations.length == 0) {
                res.status(403).json({
                    message: 'Wrong request id'
                });
                return printLog(req, res);
            }
            res.status(200).json({
                message: 'Success to find quotations',
                result: quotations
            });
            return printLog(req, res);
        } catch (error) {
            return next(error)
        }
    }




}
export default QuotationController;