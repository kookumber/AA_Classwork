const MovingObject = require("./moving_object")
const Util = require("./utils.js")
// const Utils = require("./utils.js")

const CONSTANTS = {
    COLOR: '#4f585c',
    RADIUS: 25
}

function Asteroid(options) {
    this.pos = options.pos
    this.vel = Util.randomVec(50)
    this.radius = CONSTANTS.RADIUS;
    this.color = CONSTANTS.COLOR;
}

Util.inherits(Asteroid, MovingObject)


module.exports = Asteroid;