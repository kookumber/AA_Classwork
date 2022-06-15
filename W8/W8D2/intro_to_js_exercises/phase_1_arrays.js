// console.log(arr.mySuperUniq())

Array.prototype.mySuperUniq = function() {
    let uniqArr = [];
    for (let i = 0; i < this.length; i++) {
        if (!uniqArr.includes(this[i])) {
            uniqArr.push(this[i]);
        }
    }
    return uniqArr;
}
// arr = [1, 2, 2, 3, 3, 3];
// console.log(arr.mySuperUniq()); // => [1, 2, 3]

Array.prototype.twoSum = function() {
    let sumArr = [];
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = 1; j < this.length; j++) {
            if (this[i] + this[j] === 0){
                sumArr.push(i, j)
            }
        }
    }
    return sumArr;
}

// arr = [2, 6, -2, -3, 9]
// console.log(arr.twoSum()); // => [0, 2]

Array.prototype.transpose = function() {
    let transposedArr = [];
    let len = this[0].length
    for (let i = 0; i < len; i++) {
        let subArr = [];
        for (let j = 0; j < this[i].length; j++) {
            subArr.push(this[j][i]);
        }
        transposedArr.push(subArr)
    }
    return transposedArr;
}

arr = [ [1, 2, 5], 
        [2, 3, 4], 
        [2, 5, 6] ];

// console.log(arr.transpose())
//Should equal
// [
//     [1, 2, 2],
//     [2, 3, 5],
//     [5, 4, 6]
// ]

// const newTransposeArr = [
//     [5, 1, 2],
//     [3, 7, 1],
//     [2, 2, 7]
// ];

// const cat.twoSum = new Array([1, 2, 2, 3, 3, 3])

// console.log(newTransposeArr.transpose())
// console.log(cat__proto__ === Array.prototype)

