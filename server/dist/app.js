"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const HttpException_1 = __importDefault(require("./middlewares/HttpException"));
require("dotenv/config");
const app = (0, express_1.default)();
app.set('port', process.env.PORT);
app.get('/test', (req, res, next) => {
    res.send('Hello world!');
});
app.use((req, res, next) => {
    const error = new HttpException_1.default(404, `Not exist ${req.method} ${req.url} router`);
    next(error);
});
app.use((err, req, res, next) => {
    console.log(err);
    res.locals.message = err.message;
    res.locals.error = process.env.NODE_ENV === 'develop' ? err : {};
    res.status(err.status || 500).send();
});
app.listen(app.get('port'), () => {
    console.log('Running server...');
});
