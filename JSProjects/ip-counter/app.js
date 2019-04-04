// Main method, passes calculated ranges to the DOM
// and displayed on the Jumbotron
const main = () => {
  let ipMin = document.getElementById('ip-min').value
  let ipMax = document.getElementById('ip-max').value

  let display = ipsBetween(ipMin, ipMax)
  console.log(typeof display)
  if (typeof display === 'number') {
    return (document.getElementById(
      'display'
    ).innerHTML = `There are ${display} addresses between ${ipMin} and ${ipMax}.`)
  } else {
    return (document.getElementById('display').innerHTML = display)
  }
}

// converts the string passed in from the web page into a Number array.
const stringToIntArray = str => {
  return str.split('.').map(x => parseInt(x))
}

// finds the difference between the high and low in each octet
const getDifferenceArray = (arr1, arr2) => {
  let resultArray = []
  for (let i = 0; i < 4; i++) {
    resultArray.push(arr1[i] - arr2[i])
  }
  return resultArray
}

// calculates the binary range from the sum of the octets
// returns the absolute value in case the ranges were reverse
// by the user
const ipsBetween = (input1, input2) => {
  if (validateInputs(input1, input2)) {
    let arr1 = stringToIntArray(input1)
    let arr2 = stringToIntArray(input2)
    let resultArr = getDifferenceArray(arr1, arr2).reverse()
    for (let i = 0; i < 4; i++) {
      resultArr[i] = resultArr[i] * Math.pow(256, i)
    }
    return Math.abs(resultArr.reduce((a, b) => a + b, 0))
  } else {
    return hasValidationErrors(input1, input2)
  }
}

// validates that the user input was a string and that the
// string was a valid series of IPv4 octets
// N.B. the input type for index.html is a type="text", so all inputs
// should are a string when grabbed by the script. The test for strings
// is used to validate input in the unit test.
const validateInputs = (input1, input2) => {
  if (typeof input1 === 'string' && typeof input2 === 'string') {
    let arr1 = stringToIntArray(input1)
    let arr2 = stringToIntArray(input2)
    if (arr1.length !== 4 || arr2.length !== 4) {
      return false
    } else {
      return true
    }
  }
  return false
}

// If there are validation errors, these errors are returned and
// passed on to the DOM to be displayed on the Jumbotron.
const hasValidationErrors = (input1, input2) => {
  if (typeof input1 !== 'string' || typeof input2 !== 'string') {
    return 'Inputs must be entered as a string'
  }
  let arr1 = stringToIntArray(input1)
  let arr2 = stringToIntArray(input2)
  if (arr1.length !== 4) {
    return 'First input is not an IP address'
  } else if (arr2.length !== 4) {
    return '2nd input is not an IP address'
  }
}

module.exports = {
  ipsBetween,
  main
}
