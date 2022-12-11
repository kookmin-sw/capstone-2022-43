import express, { Request, Response, NextFunction } from "express";
import { verifyAnyToken, verifyOwnerToken } from "../../middlewares/verifyToken";
import ReviewController from "../../controller/ReviewController";


const router = express.Router();
const reviewController: ReviewController = new ReviewController();
/**
 * @swagger
 * /api/reviews:
 *   get:
 *     tags: [/api/reviews]
 *     summary: Respond matched review data with users token
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
 *                 message:
 *                   type: string
 *                   example: Success to find reviews
 *                 result:
 *                   type: array
 *                   items:
 *                     allOf:
 *                     - $ref: '#/components/schemas/Review'
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
 *                 message:
 *                   type: string
 *                   example: Success to insert review
 */
router.post('/',verifyOwnerToken ,reviewController.registerReview);

export default router;