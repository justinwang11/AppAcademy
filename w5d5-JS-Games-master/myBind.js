Function.prototype.myBind = function (context) {
  var fn = this; // this = function that takes attributes from Function.prototype
  function(fn, context) {
    fn.apply(context);
  }
};
