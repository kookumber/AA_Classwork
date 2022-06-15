/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n// const Utils = require(\"./utils.js\")\n\nconst CONSTANTS = {\n    COLOR: '#4f585c',\n    RADIUS: 25\n}\n\nfunction Asteroid(options) {\n    this.pos = options.pos\n    this.vel = Util.randomVec(50)\n    this.radius = CONSTANTS.RADIUS;\n    this.color = CONSTANTS.COLOR;\n}\n\nUtil.inherits(Asteroid, MovingObject)\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\nconst Utils = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\")\n\nconst CONSTANTS = {\n    DIM_X: 69,\n    DIM_Y: 42,\n    NUM_ASTEROIDS: 18\n}\n\nclass Game{\n    constructor(){\n        this.DIM_X = CONSTANTS.DIM_X\n        this.DIM_Y = CONSTANTS.DIM_Y\n        this.NUM_ASTEROIDS = CONSTANTS.ASTEROIDS\n        this.asteroids = []\n    }\n}\n\nGame.prototype.addAsteroids = function(){\n    const ass = new Asteroid({pos: [this.randomPosition(), this.randomPosition()]})\n    return ass\n}\n\nGame.prototype.randomPosition = function(){\n    let rand = Math.random() * 650;\n    rand = Math.floor(rand)\n    return rand\n}\n\n\nGame.prototype.draw = function(context){\n    context.clearRect(0, 0, 750, 750);\n    for(let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++) {\n        this.asteroids.push(this.addAsteroids())\n        this.asteroids[i].draw(context)\n    }\n}\n\nGame.prototype.moveObjects = function(){\n    for(let i = 0; i < this.asteroids.length; i++){\n        this.asteroids[i].move();\n    }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\nfunction GameView() {\n    this.game = new Game();\n    this.drawing = this.game.draw(canvas)\n    this.moving = this.game.moveObjects()\n\n}\n\nGameView.prototype.start = function() {\n    let that = this;\n    setInterval(() => {\n\n        that.game.draw(canvas)\n        that.game.moveObjects()\n    }, 110)\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("console.log(\"Webpack is working!\")\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Util = Util;\nwindow.Game = Game;\nwindow.GameView = GameView;\n\n\nwindow.addEventListener('DOMContentLoaded', () => {\n    const canvas = document.getElementById('game-canvas').getContext('2d')\n    window.canvas = canvas\n    window.game = new GameView()\n    window.game.start()\n})\n\nconst canvas = document.getElementById('game-canvas').getContext('2d')\n\n\n// const canvas = document.getElementById('game-canvas')\n// const context = canvas.getContext('2d')\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("// const Game = require('./game.js')\n\nfunction MovingObject(obj){\n    this.pos = obj.pos;\n    this.vel = obj.vel;\n    this.radius = obj.radius;\n    this.color = obj.color;\n}\n\nMovingObject.prototype.draw = function(context) {\n    context.fillStyle = this.color;\n    context.beginPath();\n    context.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        true\n    );\n    context.stroke();\n    context.fill();\n}\n\n\nMovingObject.prototype.move = function(){\n    this.pos[0] += this.vel[0]\n    this.pos[1] += this.vel[1]\n}\n\nmodule.exports = MovingObject;\n\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("// Function.prototype.inherits = function(ParentClass) {\n//     function Surrogate() {};\n//     Surrogate.prototype = ParentClass.prototype;\n//     this.prototype = new Surrogate();\n//     this.prototype.constructor = this\n// }\nconst Util = { \n    inherits(childClass, parentClass){\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n    \n\n}\n\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;