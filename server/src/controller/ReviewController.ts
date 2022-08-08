import ReviewService from "../service/ReviewService";
import {NextFunction, Request, Response} from "express";
import printLog from "../middlewares/printLog";
import Review from "../domain/Review";

class ReviewController {
    private reviewService: ReviewService = new ReviewService();

    public registerReview = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const owner_uuid = req.decoded.uuid;
            let review =  req.body as Review;
            review.owner_uuid = owner_uuid;
            await this.reviewService.registerReivew(review);

            res.status(200).json({
                message: 'Success to insert review',
            });
            return printLog(req, res);
        } catch (error){
            return next(error);
        }
    }

    public getReview = async (req: Request, res: Response, next: NextFunction) => {
        try {
            const { role, uuid } = req.decoded;
            const user = `${role}_uuid`;

            const reviews = await this.reviewService.getReviewByRole(user, uuid);


            res.status(200).json({
                status: 200,
                message: 'Success to find reviews',
                Review: reviews,
            });
            return printLog(req, res);
        } catch (error) {
            return next(error);
        }

    }

}

export default ReviewController;