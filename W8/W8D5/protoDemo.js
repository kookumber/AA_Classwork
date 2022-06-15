// curried verion instead of function addThreeNums(num1, num2, num3) { return sum(num1, num2, num3);}

function addThreeNums(num1) {
    
    return function(num2) {
        return function(num3) {
            return num1 + num2 + num3
        };
    };
}

const bestAddNums = (num1) => (num2) => (num3) => num1 + num2 + num3; 

console.log(addThreeNums(4)(5)(5))
console.log(bestAddNums(2)(6)(8))

function continuousAdd() {
    const args = [];
    return function _curriedAdd(num) {

        args.push(num);
        console.log(args.reduce((acc, ele) => {
            return acc + ele;
        }));
        
        return _curriedAdd
    };
}
// Using underscore for _curriedAdd as it's standard to let you know it's a function that does something inside another function

// let calculator = continuousAdd();

// calculator(6)
// calculator(7)
// console.log(calculator(2))


// Prototyple Inheritance Example & Code Demo

const Animal = function(name) {
    this.name = name;
};

Animal.prototype.eat = function() {
    console.log(this.name + ' is eating.');
};

function Cat(name) {
    this.name = name;
    Animal.call(this, name)
}


// Cat.prototype = Animal.prototype allows Cat to eat but not good because it also allows Animal to have meow

// Cat.prototype = new Animal() also works but it could potentially run a lot of code in Cat animal constructor

function Surrogate(){} // Create an empty function that allows us to reference Animal prototype
Surrogate.prototype = Animal.prototype // This is best as Surrogate is an empty function so faster to run
Cat.prototype = new Surrogate() //Now we can make the cat prototype equal to the surrogates protos which is the same as animal
Cat.prototype.constructor = Cat // Must also point the cat back to itself

//Here, we're adding a new prototype to the cat, which has animals protos
Cat.prototype.meow = function() {
    console.log('Meow!');
}

const catty = new Cat('catty');

// catty.meow();


// ------- this is the ES6 way of writing inheritance -------
// ------- this is syntactic sugar -------
class Animals {
    constructor(name) {
        this.name = name
    }

    eat(){
        console.log(`${this.name} eats all the food`)
    }
}

class Dog extends Animals {
    constructor(name) {
        super(name)
    }

    meow(){
        console.log('Woof!')
    }
}

d = new Dog("Husky")

d.eat()