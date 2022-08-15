import express, { Request, Response, NextFunction } from "express";
import OwnerController from "../../controller/OwnerController";
import ForwarderController from "../../controller/ForwarderController";


const router = express.Router();
const ownerController: OwnerController = new OwnerController();
const forwarderController: ForwarderController = new ForwarderController();

/**
 * @swagger
 * /api/auth/login/owner:
 *   post:
 *     tags: [/api/auth]
 *     summary: Login api for owner
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [email, password]
 *             properties:
 *               email:
 *                 type: string
 *                 example: your_email
 *               password:
 *                 type: string
 *                 example: your_password
 *     responses:
 *       200:
 *         description: Success to login
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to login
 *                 token:
 *                   type: string
 *                   example: example_token
 *       400:
 *         description: User does not exist
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: User does not exist
 *       403:
 *         description: Wrong password
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Wrong password
 */
router.post('/login/owner', ownerController.login);

/**
 * @swagger
 * /api/auth/login/forwarder:
 *   post:
 *     tags: [/api/auth]
 *     summary: Login api for forwarder
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [email, password]
 *             properties:
 *               email:
 *                 type: string
 *                 example: your_email
 *               password:
 *                 type: string
 *                 example: your_password
 *     responses:
 *       200:
 *         description: Success to login
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to login
 *                 token:
 *                   type: string
 *                   example: example_token
 *       400:
 *         description: User does not exist
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: User does not exist
 *       403:
 *         description: Wrong password
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Wrong password
 */
router.post('/login/forwarder', forwarderController.login);

export default router;