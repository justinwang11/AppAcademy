(function () {
  if (typeof window.Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  Asteroids.Asteroid = function (params) {
    Asteroids.MovingObject.call(this, params);
    this.color = Asteroid.COLOR;
    this.radius = Asteroid.RADIUS;
    this.vel = Asteroids.Util.randomVec(1);
  }
  var Asteroid = Asteroids.Asteroid;
  Asteroid.COLOR = "#888888";
  Asteroid.RADIUS = 20;

  Asteroids.Util.inherits( Asteroids.Asteroid, Asteroids.MovingObject )

  Asteroid.prototype.collideWith = function (otherObject) {
    if (otherObject instanceof Asteroids.Ship) {
      otherObject.relocate();
    }
  };

})();
