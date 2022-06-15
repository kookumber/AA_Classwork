


// const sum = function() {
//     let sum = 0;
//     for(let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }
//     return sum;
// }

const sum = function (...args) {
    let sum = 0;
    for (let i = 0; i < args.length; i++) {
        sum += args[i];
    }
    // console.log(args)
    return sum;
}

// console.log(sum(5, 4, 7))



class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

Function.prototype.myBind = function (context, ...args) {
    let that = this
    let firstArgs = args
    return function () {
        return that.apply(context, firstArgs)
    }
}


Function.prototype.myBind = function(context) {
    let that = this
    // let firstArgs = args
    return function() {
        return that.apply(context, arguments) 
    }   
}

Function.prototype.myBind = function (context, arg1) {
    let that = this
    let arr = []
    arr.push(arg1)
    return function (...arg) {
        arr.push(arg)
        return that.apply(context, arr)
    }
}

// markov.says("meow", "Ned");
// console.log(markov.says.myBind(pavlov, "meow", "Kush")());
// console.log(markov.says.myBind(pavlov) "meow", "a tree"));
// console.log(markov.says.myBind(pavlov, "meow")("Markov"));

// const notMarkovSays = markov.says.myBind(pavlov);
// console.log(notMarkovSays("meow", "me"));

const curriedSum = function(numTime){
    let sums = [];
    return function _addSum(num) {
        // console.log(numTime)
        sums.push(num)
        
        const summed = sums.reduce((acc, ele) => {
            return acc + ele;
        })

        if(sums.length === numTime) { 
            return summed 
        } else {
            return _addSum
        }
    }
};

// const sum1 = curriedSum(4);
// console.log(sum1(5)(30)(20)(1));

Function.prototype.curry = function (numArgs){
    that = this
    args = []
    return function _currier(arg) {
        args.push(arg)
        console.log(args)
        if(args.length < numArgs) {
            return _currier
        } else {
            return that.apply(null, args)
        }
    }
}

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// console.log(f1)

function search(arr, target) {
    // let newArr = arr.flat()
    // return newArr.includes(target)

    let temp = []
    let newArr = arr[0]

    for(let i = 1; i < arr.length; i++) {
        newArr.concat(arr[i]);
    }
    return newArr
}

let arr = [
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 50]
]

console.log(search(arr))
// console.log(arr[0].concat(arr[1]))