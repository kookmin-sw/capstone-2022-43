import express, { NextFunction, Request, Response } from 'express';
import printLog from "../middlewares/printLog";


const router = express.Router();

/**
* @swagger
* /:
*   get:
*     tags:
*     - /
*     summary: Simple index page, Response data is "Hello World!"
*     responses:
*       200:
*         description: Simple Hello world!
*         content:
*           text/html:
*             schema:
*               type: string
*               default: Hello world!
*/

router.get('/', (req: Request, res: Response, next: NextFunction) => {
    res.status(200).send('Hello world!');
    return printLog(req, res);
});

export default router;