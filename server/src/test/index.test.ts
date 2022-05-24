import request  from 'supertest';
import * as express from "express";
// import {app} from '../app';

const app = require('../app');

describe('index.ts 통합테스트', () => {
    test('GET / 테스트', () => {
        request(app)
            .get('/')
            .expect(200)
    });


})
