(function () {
  if (typeof window.Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  Asteroids.Ship = function (params) {
    Asteroids.MovingObject.call(this, params);
    this.vel = [0, 0];
    this.radius = Ship.RADIUS;
    this.color = Ship.COLOR;
  };

  var Ship = Asteroids.Ship;
  Ship.RADIUS = 10;
  Ship.COLOR = "#3333FF";

  Asteroids.Util.inherits( Asteroids.Ship, Asteroids.MovingObject )

  Ship.prototype.relocate = function () {
    this.pos = this.game.randomPosition();
    this.vel = [0,0];
  }

  Ship.prototype.power = function (impulse) {
    this.vel[0] = (this.vel[0] + impulse[0] / 200) * 0.995;
    this.vel[1] = (this.vel[1] + impulse[1] / 200) * 0.995;
  };

  Ship.prototype.fireBullet = function () {

    this.game.add(new Asteroids.Bullet( { pos: this.pos, vel: this.vel, game: this.game } ))
  };
})();
