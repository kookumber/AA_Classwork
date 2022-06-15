function merge(left, right){
    let sorted = [];

    while(left.length > 0 && right.length > 0) {
        if(left[0] < right[0]) {
            sorted.push(left[0]);
            left.shift();
        } else {
            sorted.push(right[0]);
            right.shift();
        }
    }

    return (sorted.concat(left, right));
}

Array.prototype.mergeSort = function(func) {
    let arr = this;
    if( arr.length === 0 || arr.length === 1){
        return arr;
    }

    let mid = Math.floor(arr.length / 2);
    let left = arr.slice(0, mid);
    let right = arr.slice(mid);

    return func(left.mergeSort(func), right.mergeSort(func));

}


const newArr = [2, 5, 6, 0, 22, 3, 1, 99, 65, 62, 4]

// console.log(merge([2, 4, 3], [1, 5, 6])) // [1, 2, 4, 3, 5, 6]
console.log(newArr.mergeSort(merge))


// function bSearch(sortedArr, target) {
//     let mid = Math.floor(sortedArr.length / 2)
//     let left = sortedArr.slice(0, mid)
//     let right = sortedArr.slice(mid + 1)

//     if(sortedArr.length === 0){
//         return -1
//     }

//     if(sortedArr[mid] === target) {
//         return mid
//     } else if (sortedArr[mid] > target) {
//         return bSearch(left, target)
//     } else {
//         let stack = bSearch(right, target)
//         if (stack !== undefined) {
//             return bSearch(right, target) + left.length + 1
//         } else {
//             return - 1
//         }
//     }
// }

// coolArr = [1, 2, 3, 6, 7, 8, 10]

// console.log(bSearch(coolArr, 10))