import { Database, Resource } from '@adminjs/typeorm';
import AdminJS from 'adminjs';
import AdminJSExpress from '@adminjs/express'
import { DataSource } from "typeorm";
import { Router } from "express";
import Forwarder from "./domain/Forwarder";
import Goods from "./domain/Goods";
import Owner from "./domain/Owner";
import Quotation from "./domain/Quotation";
import Request from "./domain/Request";
import Review from "./domain/Review";


export default class AdminJSManager {

    private readonly adminJs: AdminJS

    constructor(dataSource: DataSource) {
        AdminJS.registerAdapter({ Database, Resource });
        this.adminJs = new AdminJS({
            databases: [dataSource],
            resources: [Owner, Forwarder, Request, Quotation, Review],
            rootPath: '/admin',
        }) ;

    };

    public getRouter(): Router {
        return AdminJSExpress.buildRouter(this.adminJs);
    };

    public getPath(): string {
        return this.adminJs.options.rootPath;
    };
}