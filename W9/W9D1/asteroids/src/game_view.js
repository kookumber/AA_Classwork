const Game = require('./game.js')

function GameView() {
    this.game = new Game();
    this.drawing = this.game.draw(canvas)
    this.moving = this.game.moveObjects()

}

GameView.prototype.start = function() {
    let that = this;
    setInterval(() => {

        that.game.draw(canvas)
        that.game.moveObjects()
    }, 110)
}

module.exports = GameView;