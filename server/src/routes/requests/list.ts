import express, {Request, Response, NextFunction,} from 'express';
import { dateToUnix } from "../../middlewares/timeConvert";
import { verifyForwarderToken } from "../../middlewares/verifyToken";
import requestRepository from "../../repository/RequestRepository";


const router = express.Router();

router.get('/list', verifyForwarderToken, async (req : Request, res : Response, next : NextFunction) => {
    try {
        const list = await requestRepository.find({
            select: ['trade_type', 'trade_detail', 'forwarding_date', 'departure_country', 'departure_detail',
                'destination_country', 'destination_detail', 'incoterms', 'closing_date', 'created_at']
        });

        list.forEach((selected_request) => {
            dateToUnix(selected_request, ["forwarding_date", "closing_date", "created_at"]);
        });

        return res.status(200).json({
            status: 200,
            message: 'Success to find requests',
            selectedRequests: list
        });
    }
    catch (error) {
        return next(error);
    }
});

export default router;