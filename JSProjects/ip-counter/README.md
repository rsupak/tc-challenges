# tcvc-data-structure-challenge

IP Address Counter

## Description

Write a function that accepts a starting and ending IPv4 address, and the number of IP addresses from start to end, excluding the end IP address.

All input to the function will be valid IPv4 addresses in the form of strings. The ending address will be at least one address higher than the starting address.

Write a test file which tests these cases below
test.assert_equals(ips_between("10.0.0.0", "10.0.0.50"), 50)
test.assert_equals(ips_between("20.0.0.10", "20.0.1.0"), 246)
test.assert_equals(ips_between("10.0.0.0", "10.0.1.0"), 256)
test.assert_equals(ips_between("0", "20.0.1.0"), "First input is not an IP address")
test.assert_equals(ips_between("10.0.0.0", "0"), "2nd input is not an IP address")
test.assert_equals(ips_between("10.0.0.0", 10.0.1.0), "Inputs must be entered as a string")

Create a UI where you can enter two IP address. After hitting a button there should be an output of there are X amount of IP address possible
Pick the language of your choice and place it in the Readme file

### Requirements

Create an IP counter function
Create a test file with the test cases above
Create a UI to complete the task of counting IP Addresses.

## Prerequisites
1. NodeJS
2. Mocha
3. Chai

## Local Deployment
```bash
npm install
```

## Production Build and Installation

## Manual Deployment Notes

Open the `index.html` using any browser (preferably Chrome)

## Running Tests

```bash
npm test
```

## Notes

User input via the web app will always be a string by the nature of the
input field. The test for type validity and the method that tests input
validity, specifically the test for `typeof` were build to satisfy that 
specific test. 

## Link to Demo Videos

https://youtu.be/FBm-_mOgcAQ
