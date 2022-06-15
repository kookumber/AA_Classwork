Array.prototype.myEach = function(func) {
    for (let i = 0; i < this.length; i++) {
        func(this[i])
    }
}

// const printer = function(el) {
//     console.log(el);
// }

// newArr = [2, "jello", 5]

// newArr.myEach(printer)


Array.prototype.myMap = function(func) {
    let newArr = []
    // let that = this
    // newArr.push(that.myEach(func))
    // this.myEach(el => newArr.push(func(el)))
    this.myEach(function(el) {
        newArr.push(func(el))
    })
    return newArr;
}

const doubler = function(el) {
    return (el * 2);
}

// const coolArr = [1, 1, 2, 3, 5, 8]
// console.log(coolArr.myMap(doubler))


Array.prototype.myReduce = function(func, initialValue) {
    let arr = this

    if (initialValue === undefined) {
        initialValue = arr[0]
        arr = arr.slice(1)
    }

    let result = initialValue

    arr.myEach(function (el) {
        result = func(result, el)
    })

    return result;
    // acc = initialValue ? initialValue : this[0]
}

const summer = function(el1, el2) {
    return (el1 + el2)
}
const redArr = [1, 2, 3, 4]
// console.log(redArr.myInject())

Array.prototype.bubbleSort = function(){
    arrLen = this.length;
    arr = this;
    swap = true;
    while (swap === true) {
        swap = false;
        for (let i = 0; i < arrLen - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                var temp1 = arr[i];
                var temp2 = arr[i + 1];
                arr[i] = temp2
                arr[i + 1 ] = temp1
                swap = true;
            }
        }
    }
    return arr;
}

String.prototype.subStrings = function(){
    arr = [];
    len = this.length
    for(let i = 0; i < len - 2; i++) {
        for(let j = 1; j < len; j++) {
            arr.push(this.slice(i, j))
        }
    }
    return arr;
}

// console.log([5, 4, 1, 2, 6, 0, 3, 5, 6, 99].bubbleSort())

console.log("hello".subStrings())