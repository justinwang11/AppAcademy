var readline = require("readline");
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var addNumbers = function(sum, numsLeft, completionCallback) {

  if (numsLeft === 0) {
    completionCallback(sum);
    return;
  }
  else {
    reader.question("Enter a number", function (numString) {
      var num = parseInt(numString);
      sum = sum + num;
      numsLeft = numsLeft - 1;
      console.log("sum = " + sum);
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
}

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});
