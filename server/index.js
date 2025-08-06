//importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
var server = http.createServer(app);

var io = require("socket.io")(server);

//middle ware
app.use(express.json());

const DB = "mongodb+srv://towhid:test%401@cluster0.wd4olme.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

io.onconnection('connection', (socket) => {
    console.log('connected!');
    socket.on("createRoom", ({ nickname }) => {
        console.log(nickname);
        //room is created
        //player is stored in the room
        //player is taken to the next screen
    })
});

mongoose.connect(DB).then(() => {
    console.log("Connection successful");
}).catch((e) => {
    console.log("MongoDB connection error:",e);
});

const port = process.env.PORT || 3000;
server.listen(port, '0.0.0.0', () => {
    console.log(`Server started and running on port ${port}`);
});
 