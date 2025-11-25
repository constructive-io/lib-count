"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const envalid_1 = require("envalid");
const env = (0, envalid_1.cleanEnv)(process.env, {
    DATABASE_URL: (0, envalid_1.url)(),
});
exports.default = env;
