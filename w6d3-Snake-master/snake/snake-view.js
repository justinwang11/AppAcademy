(function () {
  if (typeof Snake === "undefined") {
    window.Snake = {};
  }

  var View = window.Snake.View = function (board, $el) {
    this.board = board;
    this.bindListeners();
    var that = this;
    setInterval(function () {
      that.step();
    }, 500);
  };

  View.prototype.step = function () {
    this.board.snake.move();
    var boardText = this.board.render();
    $el.text(boardText);
  };
  View.prototype.bindListeners = function () {
    var that = this;
    $(document).on("keydown", function (event) {
      that.handleKeyEvent(event);
    });
  };

  View.KEYCODES = {
    87: "N",
    65: "W",
    83: "S",
    68: "E"
  };

  View.prototype.handleKeyEvent = function (event) {
    var dir = event.keyCode;
    this.board.snake.turn(View.KEYCODES[dir]);
  };
})();
