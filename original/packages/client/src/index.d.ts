import { PoolClient } from 'pg';
export declare class Database {
    private static instance;
    private pool;
    constructor();
    /**
     * Executes a callback function within a database transaction.
     * @param fn - A callback function that receives a PoolClient to perform database operations.
     */
    withTransaction(fn: (client: PoolClient) => Promise<void>): Promise<void>;
    /**
     * Shuts down the connection pool.
     */
    shutdown(): Promise<void>;
}
