"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// const app = require("./server.js")
var server_1 = require("./server");
var PORT = process.env.PORT || 3000;
server_1.app.listen(PORT, function () {
    console.log('hello on http://localhost:' + PORT);
});
//# sourceMappingURL=index.js.map