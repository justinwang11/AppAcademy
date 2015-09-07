(function () {
  if (typeof window.Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  Asteroids.gameView = function ( game, canvasEl ) {
    this.game = game;
    this.ctx = canvasEl.getContext("2d");

  };

  Asteroids.gameView.prototype.start = function () {
    this.game.draw(this.ctx);
    setInterval(function () {
      this.bindKeyHandlers();
      this.game.step();
      this.game.draw(this.ctx);

    }.bind(this), 1000/60)
  };

Asteroids.gameView.prototype.bindKeyHandlers = function () {
  var ship = this.game.ship
  key('up', function() { ship.power([0, -1]) });
  key('down', function() { ship.power([0, 1]) });
  key('left', function() { ship.power([-1, 0]) });
  key('right', function() { ship.power([1, 0]) });
  key('space', function() { console.log("bullet")});
};

})();
