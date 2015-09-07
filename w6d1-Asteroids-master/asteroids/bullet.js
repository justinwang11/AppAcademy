(function () {
  if (typeof window.Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  Asteroids.Bullet = function (params) {
    Asteroids.MovingObject.call(this, params);
    this.vel = params.vel;
    this.radius = Bullet.RADIUS;
    this.color = Bullet.COLOR;
  }

  var Bullet = Asteroids.Bullet;
  Bullet.RADIUS = 5;
  Bullet.COLOR = "#000";

  Asteroids.Util.inherits( Asteroids.Bullet, Asteroids.MovingObject )

  Bullet.prototype.isWrappable = false;



})();
