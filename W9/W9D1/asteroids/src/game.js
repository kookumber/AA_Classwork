const Asteroid = require("./asteroid")
const MovingObject = require("./moving_object")
const Utils = require("./utils.js")

const CONSTANTS = {
    DIM_X: 69,
    DIM_Y: 42,
    NUM_ASTEROIDS: 18
}

class Game{
    constructor(){
        this.DIM_X = CONSTANTS.DIM_X
        this.DIM_Y = CONSTANTS.DIM_Y
        this.NUM_ASTEROIDS = CONSTANTS.ASTEROIDS
        this.asteroids = []
    }
}

Game.prototype.addAsteroids = function(){
    const ass = new Asteroid({pos: [this.randomPosition(), this.randomPosition()]})
    return ass
}

Game.prototype.randomPosition = function(){
    let rand = Math.random() * 650;
    rand = Math.floor(rand)
    return rand
}


Game.prototype.draw = function(context){
    context.clearRect(0, 0, 750, 750);
    for(let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++) {
        this.asteroids.push(this.addAsteroids())
        this.asteroids[i].draw(context)
    }
}

Game.prototype.moveObjects = function(){
    for(let i = 0; i < this.asteroids.length; i++){
        this.asteroids[i].move();
    }
}

module.exports = Game;