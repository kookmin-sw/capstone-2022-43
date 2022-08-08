import Review from "../domain/Review";
import quotationRepository from "../repository/QuotationRepository";
import Quotation from "../domain/Quotation";
import reviewRepository from "../repository/ReviewRepository";

class ReviewService {

    public async registerReivew(review: Review): Promise<Review> {
        const { forwarder_uuid } = await quotationRepository.findOne({
            select: ['forwarder_uuid'],
            where: { id: review.quotation_id }
        }) as Quotation;

        review.forwarder_uuid = forwarder_uuid;
        return await reviewRepository.save(review);
    }

    public async getReviewByRole(user: string, uuid: string) {
        return await reviewRepository.createQueryBuilder('R')
            .where(user, { uuid })
            .getMany();
    }
}

export default ReviewService;