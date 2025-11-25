"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
process.env.DATABASE_URL = 'postgres://postgres:password@localhost:5432/postgres';
const src_1 = require("../src");
let client;
beforeAll(() => {
    client = new src_1.Database();
});
afterAll(() => {
    client.shutdown();
});
it('getClient', (done) => {
    client.withTransaction(async (client) => {
        try {
            const result = await client.query('SELECT 1');
            console.log(result.rows);
            done();
        }
        catch (error) {
            console.error('Error executing query:', error);
            done(error);
        }
    });
});
