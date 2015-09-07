var readline = require("readline");
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});
// reader.question("5", function(arg){
//   console.log("first arg" + arg);
//   reader.question("6", function(arg2){
//     console.log([arg, arg2]);
//   })
// })
//
var HanoiGame = function () {
  this.stacks = [[3,2,1],[],[]];
};

HanoiGame.prototype.isWon = function () {
  if (this.stacks[1] === [3,2,1] || this.stacks[2] === [3,2,1]) {
    return true;
  } else {
    return false;
  }
};

HanoiGame.prototype.isValidMove = function(startTowerIdx, endTowerIdx) {
  if (this.stacks[endTowerIdx].length === 0) {
    return true;
  }
  else if (this.stacks[startTowerIdx] < this.stacks[endTowerIdx]) {
    return true;
  }
  else {
    return false;
  }
};

HanoiGame.prototype.move = function(startTowerIdx, endTowerIdx) {
  var valid = this.isValidMove(startTowerIdx, endTowerIdx);
  if (valid === true) {
    console.log("start index" + startTowerIdx);
    console.log("tower " + this.stacks[startTowerIdx]);
    this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
    return true;
  }
  else {
    return false;
  }
};

HanoiGame.prototype.print = function () {
  console.log(JSON.stringify(this.stacks));
};

HanoiGame.prototype.callMove = function(callback) {
  this.print();
  reader.question("Enter start tower index", function (startIdx) {
    reader.question("Enter end tower index", function (endIdx) {
      callback(parseInt(startIdx), parseInt(endIdx));
    });
  });
};

HanoiGame.prototype.run = function(completionCallback) {
  // var boundMove = this.move.bind(this);
  this.callMove(function (start, end) {
    var successful = this.move(start, end);
    if (!successful) {
      console.log("FAIL");
    }
    if (!this.isWon()) {
      this.run(completionCallback);
    } else {
      console.log("you win.");
      completionCallback();
    }
  }.bind(this));
}

hanoi = new HanoiGame();
hanoi.run(function () {
  reader.close();
});
