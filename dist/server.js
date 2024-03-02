"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.app = void 0;
var express_1 = __importDefault(require("express"));
var cors_1 = __importDefault(require("cors"));
var job = [];
exports.app = (0, express_1.default)();
exports.app.use((0, cors_1.default)());
exports.app.use(express_1.default.json());
exports.app.get('/', function (req, res) {
    console.log('hello from express!');
    res.json({ message: 'this is GET /' });
});
exports.app.post('/', function (req, res) {
    job.push(req.body.item); // add the object in the list
    res.json(job);
});
//# sourceMappingURL=server.js.map