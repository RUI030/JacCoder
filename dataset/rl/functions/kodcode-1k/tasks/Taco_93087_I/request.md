# findMissingPositive

Given an unsorted array of integers, you need to find the smallest positive integer that is missing from the array. Write a function `findMissingPositive()` that takes an array of integers and returns the smallest positive integer that is not present in the array.

### Input:
First line of input contains the number of test cases `T`. For each test case, the first line contains an integer `N` (the size of the array). The second line contains `N` space-separated integers representing the elements of the array.

### Output:
For each test case, output a single line containing the smallest positive integer missing from the array.

### User Task:
The task is to complete the function `findMissingPositive()` which takes the array as an argument and returns the smallest positive integer missing from the array.

### Constraints:
1 ≤ T ≤ 30
1 ≤ N ≤ 100
-10^6 ≤ A[i] ≤ 10^6

### Example:
#### Input:
2  
5  
1 3 6 4 1 2  
4  
1 2 3 4  
#### Output:
5  
5  

#### Explanation:
**Test Case 1:** The smallest positive integer missing from the array `[1, 3, 6, 4, 1, 2]` is 5.  
**Test Case 2:** The smallest positive integer missing from the array `[1, 2, 3, 4]` is 5.

Example:
- `findMissingPositive([1, 3, 6, 4, 1, 2]) == 5`

Implement `findMissingPositive(arr: list[int]) -> int`.
