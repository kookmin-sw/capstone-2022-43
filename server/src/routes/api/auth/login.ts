import express, { Request, Response, NextFunction } from "express";
import passport from "passport";


const router = express.Router();

router.post('/', (req: Request, res: Response, next: NextFunction) => {
    passport.authenticate('local', (authError, user, info) => {
        if (authError) {
            return next(authError);
        }
        if (!user) {
            return res.json({
                message: info.message,
            });
        }

        // add token soon

        return res.status(200).json({
            message: info.message,
            token: null,
        });
    }) (req, res, next);
});

export default router;