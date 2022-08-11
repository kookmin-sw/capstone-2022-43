import {NextFunction, Request, Response} from "express";
import QuoteRequest from "../domain/Request";
import requestRepository from "../repository/RequestRepository";
import printLog from "../middlewares/printLog";
import RequestService from "../service/RequestService";

class RequestController {
    private requestService: RequestService = new RequestService();

    public getList = async (req : Request, res : Response, next : NextFunction) => {
        try {
            const list = await this.requestService.findRequests();

            res.status(200).json({
                message: 'Success to find requests',
                result: list
            });
            return printLog(req, res);
        }
        catch (error) {
            return next(error);
        }
    }

    public getRequestsById = async (req: Request, res: Response, next: NextFunction) =>{
        try {
            const request_id = Number(req.params.id);

            const selected_request = await requestRepository.findOne({
                where: { id: request_id }
            });

            res.status(200).json({
                message: 'Success to find request',
                result: selected_request
            });
            return printLog(req, res);
        }
        catch (error) {
            return next(error);
        }
    }

    public getRequests = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { uuid } = req.decoded;

            const selected_requests = await this.requestService.findRequests(uuid);

            res.status(200).json({
                message: 'Success to find requests',
                result: selected_requests
            });
            return printLog(req, res);
        }
        catch (error){
            return next(error);
        }
    }

    public registerRequest = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { uuid } = req.decoded;
            const quote_request = req.body as QuoteRequest;

            quote_request.owner_uuid = uuid;

            await this.requestService.saveRequest(quote_request);


            res.status(200).json({
                message: 'Success to register Request'
            });
            return printLog(req, res);
        }
        catch (error){
            return next(error);
        }
    }
}

export default RequestController;