(function () {
  if (window.Asteroids === 'undefined') {
    window.Asteroids = {};
  }

  Asteroids.Game = function ( DIM_X, DIM_Y, NUM_ASTEROIDS ) {
    this.DIM_X = DIM_X;
    this.DIM_Y = DIM_Y;
    this.NUM_ASTEROIDS = NUM_ASTEROIDS;
    this.asteroids = [];
    this.bullets = [];
    for (var i = 0; i < NUM_ASTEROIDS; i++) {
      this.add ( new Asteroids.Asteroid (
        { pos: this.randomPosition(), game: this } )
      );
    };
    this.ship = new Asteroids.Ship( { pos: this.randomPosition(), game: this } );
  }

  var Game = window.Asteroids.Game

  Game.prototype.add = function (obj) {
    if (obj instanceof Asteroids.Bullet) {
      this.bullets.push(obj);
    } else {
      this.asteroids.push(obj);
    }
  }

  Game.prototype.randomPosition = function () {
    var x = Math.random() * this.DIM_X;
    var y = Math.random() * this.DIM_Y;
    return [x, y];
  }


  Game.prototype.draw = function (ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    for (var i = 0; i < this.allObjects().length; i++) {
      this.allObjects()[i].draw(ctx)
    }
  }

  Game.prototype.moveObjects = function () {
    for (var i = 0; i < this.allObjects().length; i++) {
      this.allObjects()[i].move()
    }
  }

  Game.prototype.wrap = function (pos) {
    if (pos[0] <= 0 ) {
      pos[0] += this.DIM_X;
    } else if (pos[0] >= this.DIM_X ) {
      pos[0] -= this.DIM_X;
    };
    if (pos[1] <= 0 ) {
      pos[1] += this.DIM_Y;
    } else if (pos[1] >= this.DIM_Y ) {
      pos[1] -= this.DIM_Y;
    };

    return pos;
  }

  Game.prototype.checkCollisions = function () {
    for (var i = 0; i < this.allObjects().length - 1; i++) {
      for (var j = i + 1; j < this.allObjects().length; j++) {
        if (this.allObjects()[i].isCollidedWith(this.allObjects()[j])) {
          this.allObjects()[i].collideWith(this.allObjects()[j]);
        }
      }
    }
  };

  Game.prototype.step = function () {
    this.moveObjects();
    this.checkCollisions();
  };

  Game.prototype.remove = function ( asteroid ) {
    if (obj instanceof Asteroids.Bullet) {
      var idx = this.bullets.indexOf(Bullet);
      this.bullets.splice(idx, 1);
    } else {
      var idx = this.asteroids.indexOf(asteroid);
      this.asteroids.splice(idx, 1);
    };
  };

  Game.prototype.allObjects = function () {
    return this.bullets.concat( this.asteroids.concat(this.ship) );
  };

  Game.prototype.isOutOfBounds = function (pos) {
    return (pos[0] <= 0 || pos[0] >= this.DIM_X ||
      pos[1] <= 0 || pos[1] >= this.DIM_Y);
  };

})();
