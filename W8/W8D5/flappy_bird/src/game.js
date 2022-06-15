import Bird from "./bird";
import Level from "./level"


export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.restart()
  }

  restart() {
    this.level = new Level(this.dimensions)
    this.animate();
    this.bird = new Bird(this.dimensions)
    
  }

  animate() {
    this.level.animate(this.ctx)
    this.bird.animate(this.ctx)
  }
}

const canvas = document.getElementById('canvas')

