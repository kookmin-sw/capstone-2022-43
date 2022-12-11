import express, { Request, Response, NextFunction } from 'express';
import OwnerController from "../../controller/OwnerController";
import ForwarderController from "../../controller/ForwarderController";
import {verifyAnyToken} from "../../middlewares/verifyToken";


const router = express.Router();
const ownerController: OwnerController = new OwnerController();
const forwarderController: ForwarderController = new ForwarderController();
/**
 * @swagger
 * /api/users/forwarder:
 *   get:
 *     tags: [/api/users/]
 *     summary: Respond forwarder information, that are matched with uuid
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [forwarder_uuid]
 *             properties:
 *               forwarder_uuid:
 *                 type: string
 *                 example: forwarder_uuid
 *     responses:
 *       200:
 *         description: Success to find forwarder
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to find forwarder
 *                 result:
 *                   $ref: '#/components/schemas/Forwarder'
 */
router.get('/forwarder', verifyAnyToken, forwarderController.getForwarder);


/**
 * @swagger
 * /api/users/owner:
 *   get:
 *     tags: [/api/users/]
 *     summary: Respond owner information, that are matched with uuid
 *     requestBody:
 *       description: Request body data
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required: [owner_uuid]
 *             properties:
 *               owner_uuid:
 *                 type: string
 *                 example: owner_uuid
 *     responses:
 *       200:
 *         description: Success to find owner
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Success to find owner
 *                 result:
 *                   $ref: '#/components/schemas/Owner'
 */

router.get('/owner', verifyAnyToken, ownerController.getOwner);
export default router;