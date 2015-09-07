var bubbleSort = function(arr) {
  var swapped = false;

  while (true) {
    for (var i = 0; i < (arr.length - 1); i++) {
      if (arr[i] > arr[i + 1]) {
        arr[i + 1] = [arr[i], arr[i] = arr[i + 1]][0];
        swapped = true;
      }
    }

    if (swapped === false) { break; }
    swapped = false;
  }

  return arr;
};

var substrings = function(str) {
  var subs = [];

  var outerIdx = 0;
  var innerIdx = 1;

  while (outerIdx < str.length) {
    while (innerIdx < str.length + 1) {
      if (subs.indexOf(str.slice(outerIdx, innerIdx)) === -1) {
          subs.push(str.slice(outerIdx, innerIdx));
        }
        innerIdx++;
      }
    outerIdx++;
    innerIdx = outerIdx + 1;
  }
  return subs;
};
