/* eslint-env mocha */

const assert = require('chai').assert
const app = require('../app')

describe('IP Address Counter', function () {
  it('correctly calculates IP Address range in the same octet', function () {
    let input1 = '10.0.0.0'
    let input2 = '10.0.0.50'
    let result = app.ipsBetween(input1, input2)
    assert.equal(result, 50)
  })

  it('correctly calculates IP Address range in different octets', function () {
    let input1 = '20.0.0.10'
    let input2 = '20.0.1.0'
    let result = app.ipsBetween(input1, input2)
    assert.equal(result, 246)
  })

  it('correctly calculates ranges from the start of one octet to the start of another', function () {
    let input1 = '10.0.0.0'
    let input2 = '10.0.1.0'
    let result = app.ipsBetween(input1, input2)
    assert.equal(result, 256)
  })

  it('checks for the correct input format in the first input', function () {
    let input1 = '0'
    let input2 = '10.0.1.0'
    let result = app.ipsBetween(input1, input2)
    assert.equal(result, 'First input is not an IP address')
  })

  it('checks for the correct input format in the second input', function () {
    let input1 = '10.0.0.0'
    let input2 = '0'
    let result = app.ipsBetween(input1, input2)
    assert.equal(result, '2nd input is not an IP address')
  })

  it('checks that the inputs are strings', function () {
    let input1 = '10.0.0.0'
    let input2 = 10010
    let result = app.ipsBetween(input1, input2)
    assert.equal(result, 'Inputs must be entered as a string')
  })
})
