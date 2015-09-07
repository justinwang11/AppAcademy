function Clock () {
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  // Format the time in HH:MM:SS
  var seconds = this.currentTime.getSeconds();
  var hours = this.currentTime.getHours();
  var minutes = this.currentTime.getMinutes();
  console.log(hours + ":" + minutes + ":" + seconds);
};

Clock.prototype.run = function () {
  // 1. Set the currentTime.
  // 2. Call printTime.
  // 3. Schedule the tick interval.
  this.currentTime = new Date();
  this.printTime();
  setInterval(this._tick.bind(this), Clock.TICK);
};

Clock.prototype._tick = function () {
  // 1. Increment the currentTime.
  // 2. Call printTime.
  this.currentTime = new Date(this.currentTime.getTime() + Clock.TICK);
  this.printTime();
};

var clock = new Clock();
var clock2 = new Clock();
clock.run(); // clock._tick()
// clock2.run(); // clock2._tick()
