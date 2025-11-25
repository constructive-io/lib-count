"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Database = void 0;
const pg_1 = require("pg");
const env_1 = __importDefault(require("./env"));
class Database {
    static instance;
    pool;
    constructor() {
        if (Database.instance) {
            return Database.instance;
        }
        const pgPoolConfig = {
            connectionString: env_1.default.DATABASE_URL,
        };
        this.pool = new pg_1.Pool(pgPoolConfig);
        // Ensure the pool is closed on process termination
        process.on('SIGTERM', async () => {
            await this.shutdown();
        });
        Database.instance = this;
        return this;
    }
    /**
     * Executes a callback function within a database transaction.
     * @param fn - A callback function that receives a PoolClient to perform database operations.
     */
    async withTransaction(fn) {
        const client = await this.pool.connect();
        try {
            await client.query('BEGIN');
            try {
                await fn(client);
                await client.query('COMMIT');
            }
            catch (e) {
                console.error('Error during transaction:', e);
                await client.query('ROLLBACK');
                throw e; // Re-throw the error to propagate it
            }
        }
        finally {
            client.release();
        }
    }
    /**
     * Shuts down the connection pool.
     */
    async shutdown() {
        await this.pool.end();
    }
}
exports.Database = Database;
