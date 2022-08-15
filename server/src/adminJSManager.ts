import { Database, Resource } from '@adminjs/typeorm';
import AdminJS, { ResourceOptions } from 'adminjs';
import AdminJSExpress from '@adminjs/express'
import { DataSource } from "typeorm";
import { Router } from "express";
import dataSource from "./data-source";
import Forwarder from "./domain/Forwarder";
import Owner from "./domain/Owner";
import Quotation from "./domain/Quotation";
import Request from "./domain/Request";
import Review from "./domain/Review";
import Admin from "./domain/Admin";


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

    public getPath(): string {
        return this.adminJs.options.rootPath;
    };

    public getRouter(): Router {
        return AdminJSExpress.buildAuthenticatedRouter(this.adminJs, {
            cookiePassword: process.env.ADMIN_PAGE_COOKIE!,
            authenticate: async (email: string, password: string) => {
                try {
                    const admin = await dataSource.getRepository(Admin).findOneBy({ email });
                    return admin?.password === password;
                } catch (e) {
                    console.log(e)
                }
                return false;
            },
        });
    };
};