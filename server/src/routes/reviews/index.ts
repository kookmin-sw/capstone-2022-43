import express, { Request, Response, NextFunction } from "express";
import { verifyAnyToken, verifyOwnerToken } from "../../middlewares/verifyToken";
import { dateToUnix } from "../../middlewares/timeConvert";
import quotationRepository from "../../repository/QuotationRepository";
import reviewRepository from "../../repository/ReviewRepository";
import Owner from "../../domain/Owner";
import Forwarder from "../../domain/Forwarder";
import Quotation from "../../domain/Quotation";
import QuoteRequest from '../../domain/Request';
import forwarderRepository from "../../repository/ForwarderRepository";
import requestRepository from "../../repository/RequestRepository";
import ownerRepository from "../../repository/OwnerRepository";
import reviews from "../reviews";
import printLog from "../../middlewares/printLog";
import ReviewController from "../../controller/ReviewController";


const router = express.Router();
const reviewController: ReviewController = new ReviewController();
/**
 * @swagger
 * /api/reviews:
 *   get:
 *     tags: [/api/reviews]
 *     summary: Respond matched review data with user token
 *     security:
 *     - OwnerToken: []
 *     - ForwarderToken: []
 *     responses:
 *       200:
 *         description: Success to find reviews
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 200
 *                 message:
 *                   type: string
 *                   example: Success to find reviews
 *                 Review:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Review'
 *                     - type: object
 *                       properties:
 *                         forwarder:
 *                           $ref: '#/components/schemas/Forwarder'
 *                         owner:
 *                           $ref: '#/components/schemas/Owner'
 *                         requests:
 *                           $ref: '#/components/schemas/Request'
 *                         quotations:
 *                           $ref: '#/components/schemas/Quotation'
 *                 selectedGoods:
 *                   type: array
 *                   example: []
 */
router.get('/', verifyAnyToken , reviewController.getReview);

/**
 * @swagger
 * /api/reviews:
 *   post:
 *     tags: [/api/reviews]
 *     summary: Create instances to REVIEW table, After then respond forwarder info, owner info, request info and quotation info
 *     security:
 *     - OwnerToken: []
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *             - score
 *             - message
 *             - quotation_id
 *             - request_id
 *             properties:
 *               score:
 *                 type: number
 *                 example: 4
 *               message:
 *                 type: string
 *                 example: good!
 *               quotation_id:
 *                 type: number
 *                 example: 1
 *               request_id:
 *                 type: number
 *                 example: 1
 *     responses:
 *       200:
 *         description: Success to insert review
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 200
 *                 message:
 *                   type: string
 *                   example: Success to insert review
 *                 Review:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Review'
 *                     - type: object
 *                       properties:
 *                         forwarder:
 *                           $ref: '#/components/schemas/Forwarder'
 *                         owner:
 *                           $ref: '#/components/schemas/Owner'
 *                         requests:
 *                           $ref: '#/components/schemas/Request'
 *                         quotations:
 *                           $ref: '#/components/schemas/Quotation'
 *                 selectedGoods:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Goods'
 */
router.post('/',verifyOwnerToken ,reviewController.registerReview);

export default router;