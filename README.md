# topcoder challenges


## Stack and Queue
Tech Stack: Ruby

Challenge Overview
This is the first in a series of challenges of learning basic computer science data structures in ruby. In the first step to 
this challenge we will create methods to build a stack and queue. You must complete all of the methods (provided) and get all 
the test in the Rspec file to pass. We will be adding more complex data structures as we go on. The is a github link for the 
four files are listed in the in the forum. There is a blank stack file and a test file. And then there is a black queue file 
and test file



## Linked List
Tech Stack: Ruby

Challenge Overview
This is the second in a series of challenges of learning basic computer science data structures in ruby. In the second step to 
this challenge we will create methods to build a linked list. You must complete all of the methods (provided) and get all the 
test in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for the 
skeleton starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test 
file will be exactly the same except the values for the nodes will be different.




## Hash Table Part 1 - Chaining
Tech Stack: Ruby

Challenge Overview
This is the third in a series of challenges of learning computer science data structures in ruby. In the 3rd step to this 
challenge we will create methods to build a hash table. You must complete all of the methods (provided) and get all the test 
in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for the skeleton 
starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test file will 
be exactly the same except the values for the nodes will be different.




## Hash Table Part 2 - Open Addressing
Tech Stack: Ruby

Challenge Overview
This is the third in a series of challenges of learning computer science data structures in ruby. In the 4th step to this 
challenge is you will create methods to build a hash table. The difference in this hash table is the collision resolution 
technique. The collision resolution method is called open-addressing. You must complete all of the methods (provided) and get 
all the test in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for 
the skeleton starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test file will be exactly the same except the values for the nodes will be different.


## Command Line Address Book Part 4: Edge Cases
Tech Stack: Ruby, SQLite3

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


##Pigeonhole Sort
Tech Stack: Ruby

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


##Snail Sort
Tech Stack: Ruby

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
Tech Stack: Ruby
This is the fifth in a series of challenges of learning computer science data structures in ruby. In the 5th step to this challenge is you will create methods to build a dijkstras graph. You must get all the test in the Rspec file to pass. The rspec test file is in the forum. You can build the graph anyway you like as long as all of the test in the Rspec file pass. There will be a blind test file to prevent cheating. The blind test file will be exactly the same except the values for the nodes will be different.

## Address Calculation Sort
### Tech Stack: Ruby

This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using address calculation sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). You can complete the task by making as many or as little methods or classes in the address_calc_sort.rb file. The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the address_calculation_sort.rb file and the test will pass but you will fail the challenge.

In this sorting algorithm, Hash Function f is used with the property of Order Preserving Function which states that if x <= y, f(x) <= f(y). Here is the hash function:
f(x) = floor( (x/maximum) * SIZE )
where maximum => maximum value in the array,
      SIZE => size of the address table (10 in our case),
      floor => floor function
This algorithm uses an address table to store the values which is simply a list (or array) of Linked lists. The Hash function is applied to each value in the array to find its corresponding address in the address table. Then the values are inserted at their corresponding addresses in a sorted manner by comparing them to the values which are already present at that address. After insertion, the values at each address in the address table are sorted. Hence we iterate through each address one by one and insert the values at that address in the input array.
