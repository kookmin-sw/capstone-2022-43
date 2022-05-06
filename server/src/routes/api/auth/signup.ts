import express, { Request, Response, NextFunction } from "express";
import { supabase } from "../../../utils/supabase";
import bcrypt from "bcrypt";
import HttpException from "../../../exceptions/HttpException";
import ShipperController from "../../../controller/ShipperController";



const router = express.Router();
const shipperController: ShipperController = new ShipperController();
console.log(shipperController);
router.post('/signup', shipperController.signUp);

export default router;