
// JS uses camelCase like bestDog/ subString/ myFunc/ etc...
// Use semi-colon at end of declaration statement or return statement
// Need to declare variables with keywords like... (let, const, var)
// Each keyword is used for specific reasons, and generally avoid using var
// Using const, we can't reassign the variable
// You cannot return inside of a forEach statement
// Use triple equals === for comparisons
// Double equals is a type conversion comparer. So if you did 0 == "0" in JS, it would return true
// .exit to get out of node in terminal
// There are seven falseys in JS - null, undefined, 0, -0, NaN, '' (empty string), false
// scope: Scope of variable is the region of a program where it can be accessed
// For const, reassignment is not allowed but mutations are
// Primitive data types are boolean, null, undefined, number, string, symbols

function madLib(str1, str2, str3) {
    console.log(`We shall ${str1} the ${str2} ${str3}`);
}

// madLib('make', 'best', 'guac')

function isSubstring(searchStr, subStr) {
    wordArr = searchStr.split(" ")
    return wordArr.includes(subStr)
}

console.log(isSubstring("Hello world again", "again"))

// function doubler(arr) {
//     let newArray = [];
//     arr.forEach(el => {
//         newArray.push(el * 2)
//     })
//     return newArray;
// }

// console.log(doubler([2, 5, 10]))


function numberFunc(num1, num2) {
    if (num1 === num2) {
        console.log("It's all the same!");
    } else if(num1 > num2) {
        console.log("He was number 1!!!");
    } else {
        console.log("It has all gone to hell!");
    }
}

// numberFunc(12312, 2)

const arr = [1, 2, 3, 4, 523213121]

// console.log(arr[arr.length - 1]) //Gets last element of array

function scopeExp() {
    const x = 'x';
    if (true){
        const y = 'not x';
    }
    //console.log(y) cannot do this because y is declared as a lower scope
    {
        const z = 'another not zed';
        console.log(x);
    }
}


// ----- CALL BACK EXAMPLES -----

// const arr = [1, 2, 3]

arr.forEach((el) => { }) // this forEach takes a function

// function hello() {} is the same as const hello = function(){}, which is also
// the same as const hello = ()=>{}

const doubler = function(el) {
    return el * 2
}

const decade = function(el) {
    return el * 10
}

const orderOfMag = function (el) {
    return el * 100
}

function doMaths(num, func) {
    return func(num)
}

 console.log(doMaths(5, orderOfMag))


 // ----- CLOSURE EXAMPLES -----


// This is a function that returns another function
    const singers = function(){
        const popStars = ["Daft Punk"];

        return function(newSinger){
            popStars.push(newSinger);
            return `I have listended to ${popStars.join(" and ")}`
        }
    }

    // users singers()() to call the function within the function
   console.log(singers()("The Stroke"))
    
   

