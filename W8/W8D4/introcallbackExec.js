// import {
//     setTimeout,
//     setImmediate,
//     setInterval,
// } from 'timers/promises'

// timing is everything
class Clock {
    constructor() {
      // 1. Create a Date object.
      let d = new Date();
      // 2. Store the hours, minutes, and seconds.
      this.seconds = d.getSeconds();
      this.minutes = d.getMinutes();
      this.hours = d.getHours();
      // 3. Call printTime.
      this.printTime();
       
     // 4. Schedule the tick at 1 second intervals.
    
       setInterval(this._tick.bind(this), 1000)

    }
    
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.
      console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this.seconds += 1;
      // console.log(this.seconds)
      this.printTime();

    }
  }
  
//  const clock = new Clock();


// const readline = require('readline');

// const reader = readline.createInterface({
//    input: process.stdin,
//    output: process.stdout
//    })

const addNumbers = function(sum, numsLeft, completionCallback) {
  
  if(numsLeft === 0) {
    completionCallback(sum)
  } else {
    reader.question(`Enter a number`, function(answer) {
  
    ans = parseInt(answer)
    sum += ans
    console.log(sum)
    newNumsLeft = numsLeft - 1
    addNumbers(sum, newNumsLeft, completionCallback)
    if (numsLeft === 0) {
      reader.close();
    }
  })
  }
 }

const sumPrinter = function(sum) {
  return console.log(`${sum}`);
}


// reader.question("How are you?", function(answer) { console.log(`You said ${answer}! Great answer!`) })
// console.log(addNumbers(2, 4, sum => console.log('55')))

// addNumbers(4, 3, sumPrinter)

class Lamp {
    constructor() {
      this.name = "a lamp";
    }
  }
  
  const turnOn = function() {
    console.log("Turning on " + this.name);
  };
  
  const lamp = new Lamp();
  
  // turnOn(); // should not work the way we want it to
  
  Function.prototype.myBind = function(context) {
    return () => this.apply(context)
  }
  

  const boundTurnOn = turnOn.bind(lamp);
  const myBoundTurnOn = turnOn.myBind(lamp);
  
const { timeStamp } = require("console");
  // // console.log(myBind(lamp))


  // boundTurnOn(); // should say "Turning on a lamp"
  // myBoundTurnOn(); // should say "Turning on a lamp"

const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.

  reader.question(`Tell us "yes" or "no" if ${el1} > ${el2}`, function(answer) {
    if (answer === 'yes') {
      callback(true)
    } else {
      callback(false)
    }
    // reader.close()
  })
}

// console.log(askIfGreaterThan(6, 10, function(bool){ console.log(bool)}))

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
    if (i === (arr.length - 1)) {
      return outerBubbleSortLoop(madeAnySwaps);
    }

   if (i < arr.length - 1){
      askIfGreaterThan(arr[i], arr[i+1], (isGreaterThan) => { 
          if (isGreaterThan){
               temp  = arr[i]
               arr[i] = arr[i+1]
               arr[i+1] = temp
               madeAnySwaps = true;
          }
          // console.log(arr)
          innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop)
        })
    }
}

// console.log(innerBubbleSortLoop([5, 2, 3, 1, 4], 0, false, () => {console.log("outer")}))

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if(!madeAnySwaps) {
      sortCompletionCallback(arr)
    } else {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop)
    }
  }
  outerBubbleSortLoop(true)
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1, 4, 5], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

