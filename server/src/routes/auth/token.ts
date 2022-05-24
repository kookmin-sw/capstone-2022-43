import express, { Request, Response, NextFunction } from 'express';
import { verifyAnyToken, verifyOwnerToken, verifyForwarderToken } from "../../middlewares/verifyToken";
import printLog from "../../middlewares/printLog";


const resToken = (req: Request, res: Response, next: NextFunction) => {
    try {
        res.status(200).json({
            status: 200,
            message: 'Token is valid',
            name: req.decoded.name,
        });
        return printLog(req, res);
    }
    catch (error){
        return next(error);
    }
}

const router = express.Router();

/**
 * @swagger
 * /api/auth/token:
 *   get:
 *     tags: [/api/auth]
 *     summary: Token api for any user
 *     security:
 *     - OwnerToken: []
 *     - ForwarderToken: []
 *     responses:
 *       200:
 *         description: Token is valid
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
 *                   example: Token is valid
 *                 name:
 *                   type: string
 *                   example: user_name
 *       401:
 *         description: Invalid token
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 401
 *                 message:
 *                   type: string
 *                   example: Invalid token
 *       419:
 *         description: The token has expired
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 409
 *                 message:
 *                   type: string
 *                   example: The token has expired
 */
router.get('/token', verifyAnyToken, resToken);

/**
 * @swagger
 * /api/auth/token/owner:
 *   get:
 *     tags: [/api/auth]
 *     summary: Token api for owner
 *     security:
 *     - OwnerToken: []
 *     responses:
 *       200:
 *         description: Token is valid
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
 *                   example: Token is valid
 *                 name:
 *                   type: string
 *                   example: user_name
 *       401:
 *         description: Invalid token
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 401
 *                 message:
 *                   type: string
 *                   example: Invalid token
 *       419:
 *         description: The token has expired
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 409
 *                 message:
 *                   type: string
 *                   example: The token has expired
 */
router.get('/token/owner', verifyOwnerToken, resToken);

/**
 * @swagger
 * /api/auth/token/forwarder:
 *   get:
 *     tags: [/api/auth]
 *     summary: Token api for forwarder
 *     security:
 *     - OwnerToken: []
 *     - ForwarderToken: []
 *     responses:
 *       200:
 *         description: Token is valid
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
 *                   example: Token is valid
 *                 name:
 *                   type: string
 *                   example: user_name
 *       401:
 *         description: Invalid token
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 401
 *                 message:
 *                   type: string
 *                   example: Invalid token
 *       419:
 *         description: The token has expired
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 status:
 *                   type: number
 *                   example: 409
 *                 message:
 *                   type: string
 *                   example: The token has expired
 */
router.get('/token/forwarder', verifyForwarderToken, resToken);

export default router;