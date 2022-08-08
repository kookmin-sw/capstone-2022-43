import {NextFunction, Request, Response} from "express";
import QuoteRequest from "../domain/Request";
import Goods from "../domain/Goods";
import {dateToUnix, unixToDate} from "../middlewares/timeConvert";
import requestRepository from "../repository/RequestRepository";
import goodsRepository from "../repository/GoodsRepository";
import printLog from "../middlewares/printLog";
import RequestService from "../service/RequestService";
import GoodsService from "../service/GoodsService";

class RequestController {
    private goodService: GoodsService = new GoodsService();
    private requestService: RequestService = new RequestService();

    public getList = async (req : Request, res : Response, next : NextFunction) => {
        try {
            const list = await this.requestService.findRequests();

            res.status(200).json({
                status: 200,
                message: 'Success to find requests',
                selectedRequests: list
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

            const selected_goods_array = await goodsRepository.find({
                where: { request_id }
            });

            res.status(200).json({
                status: 200,
                message: 'Success to find request',
                selectedRequest: selected_request,
                selectedGoods: selected_goods_array
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
                status: 200,
                message: 'Success to find requests',
                selectedRequests: selected_requests
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
            const goods = req.body as Goods;

            quote_request.owner_uuid = uuid;

            const created_request = await this.requestService.saveRequest(quote_request);

            //transaction 필요
            goods.request_id = created_request.id;

            const created_goods = await this.goodService.saveGoods(goods);


            res.status(200).json({
                status: 200,
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