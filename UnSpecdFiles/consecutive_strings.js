const longest_consec = (array, num) => {
  let consecutive_string = "";
  let start = 0;
  let stop = num;
  while (stop <= array.length) {
    let temp = array.slice(start, stop).join("");
    if (temp.length > consecutive_string.length) {
      consecutive_string = temp;
    }
    start += 1;
    stop = start + num;
  }
  return consecutive_string;
};

// x = longest_consec(
//   ["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"],
//   2
// );

// console.log(x);

function testing(actual, expected) {
  Test.assertEquals(actual, expected);
}

Test.describe("longestConsec", function() {
  Test.it("Basic tests", function() {
    testing(
      longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], 2),
      "abigailtheta"
    );
    testing(
      longestConsec(
        [
          "ejjjjmmtthh",
          "zxxuueeg",
          "aanlljrrrxx",
          "dqqqaaabbb",
          "oocccffuucccjjjkkkjyyyeehh"
        ],
        1
      ),
      "oocccffuucccjjjkkkjyyyeehh"
    );
    testing(longestConsec([], 3), "");
    testing(
      longestConsec(
        [
          "itvayloxrp",
          "wkppqsztdkmvcuwvereiupccauycnjutlv",
          "vweqilsfytihvrzlaodfixoyxvyuyvgpck"
        ],
        2
      ),
      "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
    );
    testing(
      longestConsec(
        ["wlwsasphmxx", "owiaxujylentrklctozmymu", "wpgozvxxiu"],
        2
      ),
      "wlwsasphmxxowiaxujylentrklctozmymu"
    );
    testing(
      longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], -2),
      ""
    );
    testing(
      longestConsec(["it", "wkppv", "ixoyx", "3452", "zzzzzzzzzzzz"], 3),
      "ixoyx3452zzzzzzzzzzzz"
    );
    testing(
      longestConsec(["it", "wkppv", "ixoyx", "3452", "zzzzzzzzzzzz"], 15),
      ""
    );
    testing(
      longestConsec(["it", "wkppv", "ixoyx", "3452", "zzzzzzzzzzzz"], 0),
      ""
    );
  });
});
