var readline = require("readline");

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var absurdBubbleSort = function(arr, sortCompletionCallback) {
  var outerBubbleSortLoop = function (madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

var askIfGreaterThan = function (el1, el2, callback) {
  reader.question("Is " + el1 + " > than " + el2 + "? ", function (answer) {
    if (answer === "yes") {
      callback(true); //or return true; ?
    } else {
      callback(false);
    }
  })
}

var innerBubbleSortLoop = function(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function (isGreaterThan) {
      if (isGreaterThan) {
        var temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    })
  } else if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  }
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
