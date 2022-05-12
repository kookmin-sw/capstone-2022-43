import express, { Request, Response, NextFunction } from "express";
import OwnerController from "../../controller/OwnerController";


const router = express.Router();

const ownerController: OwnerController = new OwnerController();
router.post('/signup', ownerController.signUp);

export default router;