import { Router } from "express";

class Route {
    path: string;
    router: Router;

    constructor(path: string, router: Router) {
        this.path = path;
        this.router = router;
    }
}

export default Route;