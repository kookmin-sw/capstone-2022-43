import express, { Request, Response, NextFunction } from "express";
import OwnerController from "../../controller/OwnerController";
import ForwarderController from "../../controller/ForwarderController";


const router = express.Router();
const ownerController: OwnerController = new OwnerController();
const forwarderController: ForwarderController = new ForwarderController();


router.post('/login/owner', ownerController.login);
router.post('/login/forwarder', forwarderController.login);

export default router;