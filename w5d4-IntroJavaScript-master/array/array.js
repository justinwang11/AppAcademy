var uniq = function(arr) {
  var result = [];
  for (var i = 0; i < arr.length; i++) {
    if (result.indexOf(arr[i]) === -1) {
      result.push(arr[i]);
    }
  }
  return result;
};


var twoSum = function(arr) {
  var outerIdx = 0;
  var innerIdx = 1;
  var result = [];

  while (outerIdx < arr.length - 1) {
    while (innerIdx < arr.length) {
      if (arr[outerIdx] + arr[innerIdx] === 0) {
        result.push([outerIdx, innerIdx]);
      }
      innerIdx++;
    }

    outerIdx++;
    innerIdx = outerIdx + 1;
  }

  return result;
};

var myTranspose = function(arr) {
  var result = new Array(arr.size);

  for (var i = 0; i < arr.length; i++) {
    result[i] = new Array(arr.size);
  }

  for (var i = 0; i < arr.length; i++) {
    for (var j = 0; j < arr[i].length; j++) {
      result[i][j] = arr[j][i];
    }
  }
  console.log(result);
  return result;
};
