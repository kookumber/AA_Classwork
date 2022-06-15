
// function Cat(name, owner) {
//     this.name = name
//     this.owner = owner
// }

// Cat.prototype.sound = function() {
//     return "meow!"
// }



// Refactors to ES6 class syntax

class Cat {
    constructor(name, owner) {
        this.name = name;
        this.owner = owner;
    }

    cuteStatement() {
        return `${this.owner} loves ${this.name}.`;
    }

    meow() {
        return 'meoooowww!!';
    }
}

let garfield = new Cat("Garfield");

const detachedMeow = garfield.meow;

function betterDetachedMeow() {
    return garfield.meow();
}

const boundMeow = detachedMeow.bind(garfield);

Cat.prototype.sayHi = function() {
    const that = this;

    return () => {
        timesDo( 3, this.meow.bind(this));
    }
}

function timesDo(num, cb) {
    for (let i = 0; i < num; i++) {
        cb();
    }
}