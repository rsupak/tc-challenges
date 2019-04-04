const count = () => {
  display = null;
  let ipMin = document.getElementById("ip-min").value;
  let ipMax = document.getElementById("ip-max").value;
  let ipMinArray = stringToIntArray(ipMin);
  let ipMaxArray = stringToIntArray(ipMax);

  if (ipMinArray.length == 4 && ipMaxArray.length == 4) {
    resultArray = getResultArray(ipMinArray, ipMaxArray);
    display =
      "There are " + countAddresses(resultArray) + " addresses available.";
  } else if (ipMinArray.length < 4) {
    display = "First input is not an IP address";
  } else if (ipMaxArray.length < 4) {
    display = "Second input is not an IP address";
  } else if (typeof ipMin != "string" || typeof ipMax != "string") {
    display = checkValidInputs(ipMin, ipMax);
  }

  document.getElementById("display").innerHTML = display;
};

const stringToIntArray = str => {
  return str.split(".").map(x => parseInt(x));
};

const getResultArray = (arr1, arr2) => {
  let resultArray = [];
  for (let i = 0; i < 4; i++) {
    resultArray.push(arr1[i] - arr2[i]);
  }
  return resultArray;
};

const countAddresses = arr => {
  arr = arr.reverse();
  for (let i = 0; i < 4; i++) {
    arr[i] = arr[i] * Math.pow(256, i);
  }
  return Math.abs(arr.reduce((a, b) => a + b, 0));
};

const checkValidInputs = (input1, input2) => {
  if (typeof input1 != "string" || typeof input2 != "string") {
    return "Inputs must be entered as a string";
  }
};

// console.log(checkValidInputs("192.168.1.1", 12));
module.exports = {
  checkValidInputs,
  countAddresses,
  getResultArray,
  stringToIntArray,
  count
};
