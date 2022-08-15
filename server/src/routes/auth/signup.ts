import express, { Request, Response, NextFunction } from "express";
import OwnerController from "../../controller/OwnerController";
import ForwarderController from "../../controller/ForwarderController";


const router = express.Router();

const ownerController: OwnerController = new OwnerController();
const forwarderController: ForwarderController = new ForwarderController();

/**
 * @swagger
 * /api/auth/signup/owner:
 *   post:
 *     tags: [/api/auth]
 *     summary: Sign up api for owner
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [email, password, name, phone_number]
 *             properties:
 *               email:
 *                 type: string
 *                 example: your_email
 *               password:
 *                 type: string
 *                 example: your_password
 *               name:
 *                 type: string
 *                 example: your_name
 *               phone_number:
 *                 type: string
 *                 example: your_phone_number
 *     responses:
 *       200:
 *         description: Success to sign up
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to sign up
 *       400:
 *         description: Already exist users
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Already exist users
 */
router.post('/signup/owner', ownerController.signup);

/**
 * @swagger
 * /api/auth/signup/forwarder:
 *   post:
 *     tags: [/api/auth]
 *     summary: Sign up api for forwarder
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [email, password, name, phone_number, corporation_name, corporation_number]
 *             properties:
 *               email:
 *                 type: string
 *                 example: your_email
 *               password:
 *                 type: string
 *                 example: your_password
 *               name:
 *                 type: string
 *                 example: your_name
 *               phone_number:
 *                 type: string
 *                 example: your_phone_number
 *               corporation_name:
 *                 type: string
 *                 example: your_corporation_name
 *               corporation_number:
 *                 type: string
 *                 example: your_corporation_number
 *     responses:
 *       200:
 *         description: Success to sign up
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to sign up
 *       400:
 *         description: Already exist users
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Already exist users
 */
router.post('/signup/forwarder', forwarderController.signup);

export default router;