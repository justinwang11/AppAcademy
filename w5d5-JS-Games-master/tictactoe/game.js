board = require("./board").board
var readline = require("readline");
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

var Game = function (reader) {
  this.reader = reader;
  this.board = new Board();
};

Game.prototype.run = function(completionCallback) {
  
};
