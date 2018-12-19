# topcoder challenges


##Stack and Queue
###Tech Stack: Ruby

Challenge Overview
This is the first in a series of challenges of learning basic computer science data structures in ruby. In the first step to 
this challenge we will create methods to build a stack and queue. You must complete all of the methods (provided) and get all 
the test in the Rspec file to pass. We will be adding more complex data structures as we go on. The is a github link for the 
four files are listed in the in the forum. There is a blank stack file and a test file. And then there is a black queue file 
and test file



##Linked List
###Tech Stack: Ruby

Challenge Overview
This is the second in a series of challenges of learning basic computer science data structures in ruby. In the second step to 
this challenge we will create methods to build a linked list. You must complete all of the methods (provided) and get all the 
test in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for the 
skeleton starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test 
file will be exactly the same except the values for the nodes will be different.




##Hash Table Part 1 - Chaining
###Tech Stack: Ruby

Challenge Overview
This is the third in a series of challenges of learning computer science data structures in ruby. In the 3rd step to this 
challenge we will create methods to build a hash table. You must complete all of the methods (provided) and get all the test 
in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for the skeleton 
starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test file will 
be exactly the same except the values for the nodes will be different.




##Hash Table Part 2 - Open Addressing
###Tech Stack: Ruby

Challenge Overview
This is the third in a series of challenges of learning computer science data structures in ruby. In the 4th step to this 
challenge is you will create methods to build a hash table. The difference in this hash table is the collision resolution 
technique. The collision resolution method is called open-addressing. You must complete all of the methods (provided) and get 
all the test in the Rspec file to pass. We will be adding more complex data structures as we go on. There is a github link for 
the skeleton starter file and rspec test file in the forum. There will be a blind test file to prevent cheating. The blind test file will be exactly the same except the values for the nodes will be different.


## Address Calculation Sort
This is a part in a series of challenges to learn sorting algorithms in ruby. In this challenge, we will create methods to sort an array using address calculation sort. You must complete all of the methods (provided) and get all the test in the Rspec file to pass (also provided). You can complete the task by making as many or as little methods or classes in the address_calc_sort.rb file. The sorting algorithms must possess the qualities of the algorithm listed. An example is you can copy and paste a bubble sort into the address_calculation_sort.rb file and the test will pass but you will fail the challenge.

In this sorting algorithm, Hash Function f is used with the property of Order Preserving Function which states that if x <= y, f(x) <= f(y). Here is the hash function:
f(x) = floor( (x/maximum) * SIZE )
where maximum => maximum value in the array,
      SIZE => size of the address table (10 in our case),
      floor => floor function
This algorithm uses an address table to store the values which is simply a list (or array) of Linked lists. The Hash function is applied to each value in the array to find its corresponding address in the address table. Then the values are inserted at their corresponding addresses in a sorted manner by comparing them to the values which are already present at that address. After insertion, the values at each address in the address table are sorted. Hence we iterate through each address one by one and insert the values at that address in the input array.
