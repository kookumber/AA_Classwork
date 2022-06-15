const BIRDCONSTS = {
    GRAVITY: 0.5
}

export default class Bird {
    constructor(dimensions) {
        this.velocity = 0;
        this.dimensions = dimensions;
        this.Y = this.dimensions.height / 2
        this.X = this.dimensions.width / 3
    }

    drawBird(context) {
        context.fillStyle = "yellow";
        context.fillRect(this.y, this.x, 40, 30);
    }

    animate() {
        this.drawBird()
    }

    move() {
        this.velocity += this.y
        
    }
};