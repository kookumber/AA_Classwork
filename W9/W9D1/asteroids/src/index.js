console.log("Webpack is working!")

const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js")
const GameView = require("./game_view.js")

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Util = Util;
window.Game = Game;
window.GameView = GameView;


window.addEventListener('DOMContentLoaded', () => {
    const canvas = document.getElementById('game-canvas').getContext('2d')
    window.canvas = canvas
    window.game = new GameView()
    window.game.start()
})

const canvas = document.getElementById('game-canvas').getContext('2d')


// const canvas = document.getElementById('game-canvas')
// const context = canvas.getContext('2d')

