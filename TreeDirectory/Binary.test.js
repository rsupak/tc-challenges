function isFunction() {
    return typeof(createBSTDirectory) === typeof(Function);
  }
  
  let tree = {
    value: 5,
    children: [
      {
        value: 4,
        children: []
      },
      {
        value: 7,
        children: [
          {
            value: 3,
            children: []
          },
          {
            value: 15,
            children: []
          }
        ]
      }
    ]
  };
  
  let bst = {
    value: 5,
    left: {
      value: 3,
      left: {
        value: 1,
        left: null,
        right: null
      },
      right: {
        value: 4,
        left: null,
        right: null
      }
    },
    right: {
      value: 7,
      left: {
        value: 6,
        left: null,
        right: null
      },
      right: {
        value: 9,
        left: null,
        right: null
      }
    }
  };
  
  let treeResult = {5: [], 4: [0], 7: [1], 3: [1, 0], 15: [1, 1]};
  let bstResult = {5: [], 3: ['left'], 1: ['left', 'left'], 4: ['left', 'right'], 7: ['right'], 6: ['right', 'left'], 9: ['right', 'right']};
  
  Test.describe("createTreeDirectory(tree)", () => {
    var result = createTreeDirectory(tree);
    Test.it("Should return {5: [], 4: [0], 7: [1], 3: [1, 0], 15: [1, 1]}", () => {
      Test.assertEquals(!!result['5'], true, "should contain a '5' property");
      Test.assertEquals(!!result['4'], true, "should contain a '4' property");
      Test.assertEquals(!!result['7'], true, "should contain a '7' property");
      Test.assertEquals(!!result['3'], true, "should contain a '3' property");
      Test.assertEquals(!!result['15'], true, "should contain a '15' property");
      Test.assertDeepEquals(result, treeResult, "Expected " + treeResult + " but got " + result);
    });
  });
  
  Test.describe("createBSTDirectory(bst)", function() {
    // if there is no createBSTDirectory, the tests will run against the createTreeDirectory function
    var result = isFunction() ? createBSTDirectory(bst) : createTreeDirectory(bst);
    Test.it("Should return {5: [], 3: ['left'], 1: ['left', 'left'], 4: ['left', 'right'], 7: ['right'], 6: ['right', 'left'], 9: ['right', 'right']}", function() {
      Test.assertEquals(!!result['5'], true, "should contain a '5' property");
      Test.assertEquals(!!result['3'], true, "should contain a '3' property");
      Test.assertEquals(!!result['1'], true, "should contain a '1' property");
      Test.assertEquals(!!result['4'], true, "should contain a '4' property");
      Test.assertEquals(!!result['7'], true, "should contain a '7' property");
      Test.assertEquals(!!result['6'], true, "should contain a '6' property");
      Test.assertEquals(!!result['9'], true, "should contain a '9' property");
      Test.assertDeepEquals(result, bstResult, "Expected " + bstResult + " but got " + result);
    });
  });