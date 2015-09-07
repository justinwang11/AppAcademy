
var sum = function() {
  var memo = 0;
  for (var i = 0; i < arguments.length; i++) {
    memo += arguments[i];
  }
  return memo;
};

Function.prototype.myBind = function (context) {
  var args = arguments;
  var fn = this;
  if (args.length < 2) {
    return function () {
      fn.apply(context, Array.prototype.slice.call(arguments,0) )
    }
  } else {
    return function () {
      fn.apply(context, Array.prototype.slice.call(args, 1))
    };
  };
};

var curriedSum = function (numArgs) {
  var numbers = [];
  var _curriedSum = function (inputNumber) {
    numbers.push(inputNumber)
    if (numbers.length === numArgs) {
      return (numbers.reduce(function (a, b) {
        return a + b;
      }));
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

a = curriedSum(3);
a1 = a(2);
a2 = a1(2);
a3 = a2(1);


Function.prototype.curry = function (numArgs) {
  var args = []
  var thisFunction = this;
  var _curriedFunction = function () {
    args = args.concat( Array.prototype.slice.call(arguments,0) );
    if (args.length >= numArgs) {
      return thisFunction.apply(thisFunction, args);
    } else {
      return _curriedFunction;
    }
  }
return _curriedFunction;
};



b = sum.curry(3)
b1 = b(2)
b2 = b1(2)
b3 = b2(2)
b3 // 6
