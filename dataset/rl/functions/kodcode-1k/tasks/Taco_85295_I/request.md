# max_subarray_sum

In a faraway land, there are magical forests known for their enchanted trees. Each tree in these forests grows exactly one unique fruit type, and these fruits have properties that can change the state of the forest when combined. The wizard of the forest has a task for you.

You are given a list of integers, where each integer represents a magical property of a fruit. Your task is to determine the maximum possible sum of magical properties of any contiguous subarray of the list.

The sum of a contiguous subarray is the total of all the elements within that subarray. A contiguous subarray can be as small as one element or as large as the entire array.

------ Input ------

First line contains a single integer N, the number of magical fruits (1 ≤ N ≤ 1000). 
Second line contains N integers, each representing the magical property of a fruit (-1000 ≤ fruit property ≤ 1000).

------ Output ------

Output a single integer, the maximum contiguous subarray sum.

----- Sample Input 1 ------
5
1 2 3 -2 5
----- Sample Output 1 ------
9
----- Explanation 1 ------
The contiguous subarray with the maximum sum is [1, 2, 3, -2, 5] which gives a sum of 9.

----- Sample Input 2 ------
4
-1 -2 -3 -4
----- Sample Output 2 ------
-1
----- Explanation 2 ------
The contiguous subarray with the maximum sum is [-1] which gives a sum of -1.

Remember, you can use negative numbers as well, and the goal is to find the subarray with the highest possible sum.

Example:
- `max_subarray_sum(5, [1, 2, 3, -2, 5]) == 9`

Implement `max_subarray_sum(n: int, fruits: list[int]) -> int`.
