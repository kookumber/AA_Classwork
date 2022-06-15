Game.prototype.wrap = function (pos) {
    let wrappedPos = pos

    if (wrappedPos[0] > 750) {
        wrappedPos[0] = 0
    } else if (wrappedPos[0] < 0) {
        wrappedPos[0] = 750
    }

    if (wrappedPos[1] > 750) {
        wrappedPos[1] = 0
    } else if (wrappedPos[1] < 0) {
        wrappedPos[1] = 750
    }

    return wrappedPos;
}