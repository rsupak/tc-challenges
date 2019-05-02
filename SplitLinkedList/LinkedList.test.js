Test.describe("tests for front-back splitting of of a linked list.", function() {
    Test.it("should be able to handle all null arguments.", function() {
      Test.expectError("throw an error if source, front, and back lists are null.", function() {frontBackSplit(null, null, null)});
    });
    Test.it("should be able to handle cases where one argument is null.", function() {
      Test.expectError("error should be thrown if source is null.", function() {frontBackSplit(null, new Node(), new Node())});
      Test.expectError("error should be thrown if front is null.", function() {frontBackSplit(new Node(), null, new Node())});
      Test.expectError("error should be thrown if back is null.", function() {frontBackSplit(new Node(), null, new Node())});
    });
    Test.it("should be able to handle a list of length 0 (empty list) or 1", function() {
      Test.expectError("error should be thrown if source has an empty node.", function() {frontBackSplit(new Node(), new Node(), new Node())});
      Test.expectError("error should be thrown if source has only one node.", function() {frontBackSplit(new Node(23), new Node(), new Node())});
    });
    Test.it("should be able to handle a list of length 2.", function() {
      var source = buildOneTwo(), front = new Node(), back = new Node();
      frontBackSplit(source, front, back);
      assertLinkedListEquals(front, new Node(1), "front should be 1 -> null.");
      assertLinkedListEquals(back, new Node(2), "back should be 2 -> null.");
    });
    Test.it("should be able to handle a list of length 3", function() {
      var source = buildOneTwoThree(), front = new Node(), back = new Node();
      frontBackSplit(source, front, back);
      assertLinkedListEquals(front, buildList([1, 2]), "front should be 1 -> 2 -> null.");
      assertLinkedListEquals(back, buildList([3]), "back should be 3 -> null.");
    });
    Test.it("should be able to handle a list of length 6", function() {
      var source = buildOneTwoThreeFourFiveSix(), front = new Node(), back = new Node();
      frontBackSplit(source, front, back);
      assertLinkedListEquals(front, buildList([1, 2, 3]), "front should be 1 -> 2 -> 3 -> null.");
      assertLinkedListEquals(back, buildList([4, 5, 6]), "back should be 4 -> 5 ->6 -> null.");
    });
    Test.it("should be able to handle a list of length 11", function() {
      var source = buildList([3, 4, 6, 1, 2, 4, 2, 0, 3, 2, 6]), front = new Node(), back = new Node();
      frontBackSplit(source, front, back);
      assertLinkedListEquals(front, buildList([3, 4, 6, 1, 2, 4]), "front should be 3 -> 4 -> 6 -> 1 -> 2 -> 4 -> null.");
      assertLinkedListEquals(back, buildList([2, 0, 3, 2, 6]), "back should be 2 -> 0 -> 3 -> 2 -> 6 -> null.");
    });
    Test.it("should be able to handle a list of length 16", function() {
      var source = buildList([3, 4, 6, 1, 2, 4, 2, 0, 3, 2, 6, 6, 5, 1, 2, 9]), front = new Node(), back = new Node();
      frontBackSplit(source, front, back);
      assertLinkedListEquals(front, buildList([3, 4, 6, 1, 2, 4, 2, 0]), "front should be 3 -> 4 -> 6 -> 1 -> 2 -> 4 -> 2 -> 0 -> null.");
      assertLinkedListEquals(back, buildList([3, 2, 6, 6, 5, 1, 2, 9]), "back should be 2 -> 0 -> 3 -> 2 -> 6 -> 6 -> 5 -> 1 -> 2 -> 9 -> null.");
    });
  });