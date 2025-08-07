const mongoose = require('mongoose');
const playerSchema = require('./player');

const roomSchema = new mongoose.Schema({
    occupancy: {
        type: Number,
        default: 2,
    },
    maxRounds: {
        type: Number,
        default: 6,
    },
    currentRound: {
        required: true,
        type: Number,
        default: 1,
    },
    players: [playerSchema],
    isJoin: {//tells us if the room is joinable or not cuz we dont want third user to disturb the game
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {//whoose turn it is
        type: Number,
        default: 0,
    },
});
//Now this is just the skeleton, we need to convert to a model so that 
//we can use it everywhere and save it in our database
//skeleton can not be saved in database

const gameModel = mongoose.model('Room', roomSchema);
module.exports = roomSchema;