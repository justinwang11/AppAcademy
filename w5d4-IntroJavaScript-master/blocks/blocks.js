var myEach = function(arr, callback) {
  for (var i = 0; i < arr.length; i++) {
    callback(arr[i]);
  }
  return arr;
};

var myAry = [1, 2, 3, 4, 5];

var myMap = function(arr, callback) {
  var result = [];
  myEach(arr, function(el) {
    result.push(callback(el));
  });
  return result;
};

var myInject = function (arr, callback) {
  var accum = arr[0];

  myEach(arr.slice(1), function(el) {
    accum = callback(accum, el);
  });

  return accum;
};
