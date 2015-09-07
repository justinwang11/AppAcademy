var range = function(start, end) {
  if (end < start) { return []; }
  var result = [];
  result.push(start);
  result = result.concat(range(start + 1, end));
  return result;
};

var range2 = function(start, end) {
  if (end < start) {
    return [];
  } else {
    var newRange = range2(start, end - 1);
    newRange.push(end);
    return newRange;
  }
};

var sum = function(arr) {
  if (arr.length === 0) { return 0; }
  var result = 0;
  result += arr[0];
  result = result + sum(arr.slice(1));
  return result;
};

var exp1 = function(base, power) {
  if (power === 0) { return 1; }
  return (base * exp1(base, power - 1));
};

var exp2 = function(base, power) {
  if (power === 0) { return 1; }
  if (power === 1) { return base; }
  if (power % 2 === 0) {
    var evenExp = exp2(base, power/2);
    return evenExp * evenExp;
  } else {
    var newPow = (power - 1)/2;
    var oddExp = exp2(base, newPow);
    return base * (oddExp * oddExp);
  }
};

var fibonacci = function(n) {
  if (n === 0) { return []; }
  if (n === 1) { return [0]; }
  if (n === 2) { return [0, 1]; }

  var fibos = [];
  fibos = fibos.concat(fibonacci(n - 1));
  fibos.push(fibos[fibos.length - 1] + fibos[fibos.length - 2]);
  return fibos;
};

var bsearch = function (arr, target) {
  if (arr.length === 0) { return null; }

  var midpoint = Math.floor(arr.length/2);
  var leftSide = arr.slice(0, midpoint);
  var rightSide = arr.slice(midpoint + 1);

  if (arr[midpoint] === target) {
    return midpoint;
  } else if (target < arr[midpoint]) {
    return bsearch(leftSide, target);
  } else {
    var subAnswer = bsearch(rightSide, target);
    if (subAnswer === null) {
      return null;
    } else {
      return subAnswer + (midpoint + 1);
    }
  }
};

var coins = [10, 7, 1];
var makeChange = function(target, coins) {
  if (target === 0) { return []; }

  var bestChange = [];
  for (var i = 0; i < coins.length; i++) {
    var currentCoin = coins[i];
    if (currentCoin > target) { continue; }
    var remainder = target - currentCoin;

    var bestRemainder = makeChange(remainder, coins);
    var thisChange = [currentCoin].concat(bestRemainder);

    if (bestChange.length === 0 || thisChange.length < bestChange.length) {
      bestChange = thisChange;
    }
  }
  return bestChange;
};

var mergeSort = function(arr) {
  if (arr.length < 2) { return arr; }
  var middle = Math.floor(arr.length / 2);

  var leftSide = arr.slice(0, middle);
  var rightSide = arr.slice(middle);

  var sortedLeft = mergeSort(leftSide);
  var sortedRight = mergeSort(rightSide);

  var merge = function(left, right) {
    var mergedAry = [];
    do {
      if (left[0] < right[0]) {
        mergedAry = mergedAry.concat(left.shift());
      } else {
        mergedAry = mergedAry.concat(right.shift());
      }
    } while (left.length > 0 && right.length > 0);

   var mergeLeft = mergedAry.concat(left);
   return mergeLeft.concat(right);
  };

  return merge(sortedLeft, sortedRight);
};

var myEach = function(arr, callback) {
  for (var i = 0; i < arr.length; i++) {
    callback(arr[i]);
  }
  return arr;
};

var myMap = function(arr, callback) {
  var result = [];
  myEach(arr, function(el) {
    result.push(callback(el));
  });
  return result;
};

// var subsets = function(arr) {
//   if (arr.length === 0) { return [[]]; }
//   var subs = subsets(arr.slice(0, arr.length - 1));
//   return subs.concat(myMap(subs, function(el) {
//     return ([arr[arr.length].concat([el]) ]);
//   }));
// };
