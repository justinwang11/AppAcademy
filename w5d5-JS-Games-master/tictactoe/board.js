module.exports.board = Board;

var Board = function () {
  this.board = new Array(new Array(3), new Array(3), new Array(3));
};

Board.prototype.render = function () {
  console.log(this.board);
};

Board.prototype.won? = function () {
  if (// helper things evaluate true) {
    return true;
  } else {
    return false;
  }
};

Board.prototype.horizontalVictory = function () {
  for (var i = 0; i < this.board.length; i++) {
    if (this.board[i].every(function (el) {
      el === 'x';
    })) {
      return true;
    } else if (this.board[i].every(function (el) {
      el === 'o';
    })) {
      return true;
    } else {
      return false;
    }
  }
};
