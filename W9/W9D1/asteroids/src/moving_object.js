// const Game = require('./game.js')

function MovingObject(obj){
    this.pos = obj.pos;
    this.vel = obj.vel;
    this.radius = obj.radius;
    this.color = obj.color;
}

MovingObject.prototype.draw = function(context) {
    context.fillStyle = this.color;
    context.beginPath();
    context.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        true
    );
    context.stroke();
    context.fill();
}


MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0]
    this.pos[1] += this.vel[1]
}

module.exports = MovingObject;

