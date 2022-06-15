

Function.prototype.inherits = function (inheritFrom) {
    let that = this

    function Surrogate() {};
    Surrogate.prototype = inheritFrom.prototype
    that.prototype = new Surrogate()
    that.prototype.constructor = that

}


function MovingObject(speed) {
    this.speed = speed
}

MovingObject.prototype.increaseSpeed = function() {
    this.speed += 5
    return `Going super fast! Speed is ${this.speed}.`
}

// function Surrogate() {};

// Surrogate.prototype = MovingObject.prototype

function Ship(name) {
    this.name = name
}

// Ship.prototype = new Surrogate()
// Ship.prototype.constructor = Ship

Ship.inherits(MovingObject)

coolShip = new Ship("Beast")
coolShip.speed = 9000
console.log(coolShip.increaseSpeed())
// function Asteroid(name) {
//     this.name = name
// }

// Asteroid.prototype = new Surrogate()
// Asteroid.prototype.constructor = Asteroid

// mo = new MovingObject(15)
// console.log(mo.speed)

// ass = new Asteroid("Hailey's Comet")
// console.log(ass.name)
// ass.speed = 100
// console.log(ass.increaseSpeed())