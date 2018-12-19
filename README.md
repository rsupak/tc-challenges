# topcoder challenges


## Stack and Queue
### Tech Stack: Ruby

Challenge Overview:

This is the first in a series of challenges of learning basic computer science data structures in ruby. In the first step to 
this challenge we will create methods to build a stack and queue. You must complete all of the methods (provided) and get all 
the test in the Rspec file to pass. We will be adding more complex data structures as we go on. The is a github link for the 
four files are listed in the in the forum. There is a blank stack file and a test file. And then there is a black queue file 
and test file



## Linked List
### Tech Stack: Ruby

Challenge Overview:

This is the second in a series of challenges of learning basic computer science data structures in ruby. In the second step to 
this challenge we will create methods to build a linked list. You must complete all of the methods (provided) and get all the 
test in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for the 
skeleton starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test 
file will be exactly the same except the values for the nodes will be different.




## Hash Table Part 1 - Chaining
### Tech Stack: Ruby

Challenge Overview:

This is the third in a series of challenges of learning computer science data structures in ruby. In the 3rd step to this 
challenge we will create methods to build a hash table. You must complete all of the methods (provided) and get all the test 
in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for the skeleton 
starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test file will 
be exactly the same except the values for the nodes will be different.




## Hash Table Part 2 - Open Addressing
### Tech Stack: Ruby

Challenge Overview:

This is the third in a series of challenges of learning computer science data structures in ruby. In the 4th step to this 
challenge is you will create methods to build a hash table. The difference in this hash table is the collision resolution 
technique. The collision resolution method is called open-addressing. You must complete all of the methods (provided) and get 
all the test in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for 
the skeleton starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test file will be exactly the same except the values for the nodes will be different.


## Bogo Sort
### Tech Stack: Ruby

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using bogo sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the bogo_sort.rb file and the test will pass but you will fail the challenge.

In computer science, bogosort is a highly ineffective sorting function based on the generate and test paradigm. The function successively generates permutations of its input until it finds one that is sorted. It is not useful for sorting, but may be used for educational purposes, to contrast it with more efficient algorithms.

Two versions of the function exist: a deterministic version that enumerates all permutations until it hits a sorted one, and a randomized version that randomly permutes its input. An analogy for the working of the latter version is to sort a deck of cards by throwing the deck into the air, picking the cards up at random, and repeating the process until the deck is sorted. Its name is a portmanteau the words bogus and sort. Either one will be accepted. 


## Consecutive Strings
### Tech Stack: Ruby

You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive strings taken in the array.

#Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"

n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

Below is an example test file in javascript. Since you can pick the language of your choice you need to create your own test file. If you choose javascript you can use the file given to you below. Your test file should test the 9 cases in the example below 

function testing(actual, expected) {
    Test.assertEquals(actual, expected)
}

Test.describe("longestConsec",function() {
Test.it("Basic tests",function() { 
    testing(longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], 2), "abigailtheta")
    testing(longestConsec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1), "oocccffuucccjjjkkkjyyyeehh")
    testing(longestConsec([], 3), "")
    testing(longestConsec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2), "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck")
    testing(longestConsec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2), "wlwsasphmxxowiaxujylentrklctozmymu")
    testing(longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], -2), "")
    testing(longestConsec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3), "ixoyx3452zzzzzzzzzzzz")
    testing(longestConsec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15), "")
    testing(longestConsec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0), "")
})})


## Comb Sort
### Tech Stack: Ruby

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using comb sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the comb_sort.rb file and the test will pass but you will fail the challenge.
 
Comb Sort is mainly an improvement over Bubble Sort. Bubble sort always compares adjacent values. So all inversions are removed one by one. Comb Sort improves on Bubble Sort by using gap of size more than 1. The gap starts with a large value and shrinks by a factor of 1.3 in every iteration until it reaches the value 1. Thus Comb Sort removes more than one inversion countswith one swap and performs better than Bublle Sort.

The basic idea is to eliminate turtles, or small values near the end of the list, since in a bubble sort these slow the sorting down tremendously. Rabbits, large values around the beginning of the list, do not pose a problem in bubble sort.

In bubble sort, when any two elements are compared, they always have a gap (distance from each other) of 1. The basic idea of comb sort is that the gap can be much more than 1. The inner loop of bubble sort, which does the actual swap, is modified such that gap between swapped elements goes down (for each iteration of outer loop) in steps of a "shrink factor" k: [ n/k, n/k2, n/k3, ..., 1 ].

The gap starts out as the length of the list n being sorted divided by the shrink factor k (generally 1.3; see below) and one pass of the aforementioned modified bubble sort is applied with that gap. Then the gap is divided by the shrink factor again, the list is sorted with this new gap, and the process repeats until the gap is 1. At this point, comb sort continues using a gap of 1 until the list is fully sorted. The final stage of the sort is thus equivalent to a bubble sort, but by this time most turtles have been dealt with, so a bubble sort will be efficient.

The shrink factor has a great effect on the efficiency of comb sort. k = 1.3 has been suggested as an ideal shrink factor by the authors of the original article after empirical testing on over 200,000 random lists. A value too small slows the algorithm down by making unnecessarily many comparisons, whereas a value too large fails to effectively deal with turtles, making it require many passes with 1 gap size.

The pattern of repeated sorting passes with decreasing gaps is similar to Shellsort, but in Shellsort the array is sorted completely each pass before going on to the next-smallest gap. Comb sort's passes do not completely sort the elements. This is the reason that Shellsort gap sequences have a larger optimal shrink factor of about 2.2.


## Gnome Sort
### Tech Stack: Ruby

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using gnome sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the gnome_sort.rb file and the test will pass but you will fail the challenge.

Gnome Sort also called Stupid sort is based on the concept of a Garden Gnome sorting his flower pots. A garden gnome sorts the flower pots by the following method-

He looks at the flower pot next to him and the previous one; if they are in the right order he steps one pot forward, otherwise he swaps them and steps one pot backwards.
If there is no previous pot (he is at the starting of the pot line), he steps forwards; if there is no pot next to him (he is at the end of the pot line), he is done.
Algorithm Steps

If you are at the start of the array then go to the right element (from arr[0] to arr[1]).
If the current array element is larger or equal to the previous array element then go one step right
If the current array element is smaller than the previous array element then swap these two elements and go one step backwards
Repeat steps 2) and 3) till ‘i’ reaches the end of the array (i.e- ‘n-1’)
If the end of the array is reached then stop and the array is sorted.


## Block Sort
### Tech Stack: Ruby

Challenge Overview
This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using block sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the block_sort.rb file and the test will pass but you will fail the challenge.

Block sort, or block merge sort, is a sorting algorithm combining at least two merge operations with an insertion sort to arrive at O(n log n) in-place stable sorting. It gets its name from the observation that merging two sorted lists, A and B, is equivalent to breaking A into evenly sized blocks, inserting each A block into B under special rules, and merging AB pairs.

## Front End How Many Cakes Part 2
## Tech Stack: Ruby

This is part 2 of creating a application that will figure how how many cakes can be baked with a certain amount of ingredients. Below is the first part of the challenge.

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

Examples:

// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

The function is written in ruby and is in the code documents are in the forum. You can pick the stack of your choice if you would like but you will need to create your own functions to complete the task that the functions in the code documents complete from scratch. This is just a baseline and you can change the provided documents as you see fit to complete this application. The front end portion is what you will be graded on in this challenge.

 

The application should have two columns. You will enter the ingredients required for the recipe in one column and then the ingredients you have available in your “pantry” in the other.

The left column will be for the recipe ingredients. In this column there should be two input fields. One field should hold the name of the ingredient. (example is sugar or flour) The other column is for the amount/integer. Each column should have an enter button. After hitting enter the input section should go back to being blank. Provide a list of the ingredient and amount that you just entered. The same goes for the other column which will be what’s in your “pantry”.

Last you need a calculate button that will output the amount of cakes you can make according to your ingredients list and pantry list. This button will call the results function.

You will need to create alerts for the following edge cases listed below.

 - no ingredients available

 - not enough ingredients

 - missing ingredient




## Command Line Address Book Part 4: Edge Cases
### Tech Stack: Ruby, SQLite3

Challenge Overview:

This is the fourth challenge in a series of challenges of building a command line application called address book. We will learn how to build an app the correct way by using Test Driven Development. You should build the test file first and then the function after. In this challenge we will be covering some edge cases and building a database for the application.

In this challenge we will make sure that our application runs smoothly by taking care of some edge cases. No edge cases were considered when building our application. An example is you can enter a person with a phone number of only 3 digits. The point of this challenge is to come up with 4 edges cases and tests for these edge cases. So for the example above maybe create an alert must enter phone number in this format 444-444-2313 if someone enters a only 3 digits into the phone number section. You can add to current functions or create new functions from scratch. It's your choice how to handle the edge cases.

Create a database for this application so when you close your application in the homepage it will save the information into a database. So the next time you open the application the enteries saved in the past will be in the address book. The structure for the data base is below

entry_id     name             phone_number       email
int              string (20)      varchar (10)            string(30)
 

When running the file in the terminal we should get this print out.

Welcome to MyAddressBook!
Main Menu - 0 entries
1 - View all entries
2 - Create an entry
3 - Search for an entry
4 - Import entries from a CSV
5 - Exit
Enter your selection:

The code base is written in Ruby. If can pick your own stack if you would like but you will have to build a command line app where all the functions from Main Menu above will work. You will only be judged on the 6 edge cases that you come up with. Tests for this challenge are only required for the edge cases. 


## Pigeonhole Sort
### Tech Stack: Ruby

Challenge Overview:

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using pigeonhole sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). You can complete the task by making as many or as little methods or classes in the address_calc_sort.rb file. The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the pigeonhole_sort.rb file and the test will pass but you will fail the challenge.

Pigeonhole sorting is a sorting algorithm that is suitable for sorting lists of elements where the number of elements and the number of possible key values are approximately the same.

It requires O(n + Range) time where n is number of elements in input array and ‘Range’ is number of possible values in array.

Working of Algorithm :

Find minimum and maximum values in array. Let the minimum and maximum values be ‘min’ and ‘max’ respectively. Also find range as ‘max-min-1’.

Set up an array of initially empty “pigeonholes” the same size as of the range.

Visit each element of the array and then put each element in its pigeonhole. An element arr[i] is put in hole at index arr[i] – min.

Start the loop all over the pigeonhole array in order and put the elements from non- empty holes back into the original array.

Comparison with Counting Sort : 
It is similar to counting sort, but differs in that it “moves items twice: once to the bucket array and again to the final destination “.


## Snail Sort
### Tech Stack: Ruby

Challenge Overview:

Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]
snail(array) #=> [1,2,3,6,9,8,7,4,5]

For better understanding, please follow the numbers of the next array consecutively:

array = [[1,2,3],
         [8,9,4],
         [7,6,5]]
snail(array) #=> [1,2,3,4,5,6,7,8,9]
 
You will need to create a test file. Below is an example test file in ruby. Since you can pick the language of your choice you need to create your own test file. If you choose javascript you can use the file given to you below. Your test file should test the 4 cases in the example below 

def test input , expected
  output = snail(input)
  Test.expect(expected == output, "When snail(#{input}) expected #{expected} but got #{output}")
end

test( [[]],[[]],[[]] , "there are no digits in the input arrays")
test( [[1,2,3], [5,6], [8] , "the number inputs in each input array must be the same")
test( [[1,2,3],[4,5,6],[7,8,9]] , [1, 2, 3, 6, 9, 8, 7, 4, 5])
test( [[1,2,3,1],[4,5,6,4],[7,8,9,7],[7,8,9,7] , [1,2,3,1,4,7,7,9,8,7,7,4,5,6,9,8])


## Dijkstra's Graph
### Tech Stack: Ruby

Challenge Overview:

This is the fifth in a series of challenges of learning computer science data structures in ruby. In the 5th step to this challenge is you will create methods to build a dijkstras graph. You must get all the test in the Rspec file to pass. The rspec test file is in the forum. You can build the graph anyway you like as long as all of the test in the Rspec file pass. There will be a blind test file to prevent cheating. The blind test file will be exactly the same except the values for the nodes will be different.

## Address Calculation Sort
### Tech Stack: Ruby

Challenge Overview:

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using address calculation sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). You can complete the task by making as many or as little methods or classes in the address_calc_sort.rb file. The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the address_calculation_sort.rb file and the test will pass but you will fail the challenge.

In this sorting algorithm, Hash Function f is used with the property of Order Preserving Function which states that if x <= y, f(x) <= f(y). Here is the hash function:
f(x) = floor( (x/maximum) * SIZE )
where maximum => maximum value in the array,
      SIZE => size of the address table (10 in our case),
      floor => floor function
This algorithm uses an address table to store the values which is simply a list (or array) of Linked lists. The Hash function is applied to each value in the array to find its corresponding address in the address table. Then the values are inserted at their corresponding addresses in a sorted manner by comparing them to the values which are already present at that address. After insertion, the values at each address in the address table are sorted. Hence we iterate through each address one by one and insert the values at that address in the input array.
