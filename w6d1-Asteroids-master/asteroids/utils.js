(function () {
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }

  if (typeof Asteroids.Util === "undefined") {
    Asteroids.Util = {};
  }

  Asteroids.Util.inherits = function (ChildClass, ParentClass) {
    function Surrogate () {};
    Surrogate.prototype = ParentClass.prototype;
    ChildClass.prototype = new Surrogate ();
  };

  Asteroids.Util.randomVec = function (length) {
    var multiplier = (Math.floor(Math.random() * 2) - 0.5) * 2;
    var x = Math.random() * (2*length) - length;
    var y = Math.sqrt(Math.pow(length, 2) - Math.pow(x, 2)) * multiplier;

    return [x, y];
  };
})();
