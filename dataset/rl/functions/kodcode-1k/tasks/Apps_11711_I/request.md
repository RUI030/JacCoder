# maximize_sum

You have a sequence of n non-negative integers, where n is an even number. You are allowed to perform the following operation exactly once: choose any two consecutive elements in the sequence and remove them from the sequence. After removing the elements, add their sum at the position where the two elements were removed.

Your task is to choose the best possible pair of consecutive elements to remove such that the remaining sequence's sum is maximized.

Write a function `maximize_sum(sequence: List[int]) -> int` that takes a list of non-negative integers as input and returns an integer representing the maximum sum of the remaining sequence after one operation.

-----Constraints-----
- 2 \leq n \leq 10^5
- n is an even number
- 0 \leq sequence[i] \leq 10^9

-----Input-----
Input is given from Standard Input in the following format:
- The first line contains a single integer n.
- The second line contains n space-separated non-negative integers representing the sequence.

-----Output-----
Print the maximum sum of the remaining sequence after one operation.

-----Sample Input-----
4
1 2 3 4

-----Sample Output-----
10

Explanation:
The sums of removing each pair and inserting their sums are:
- Removing 1 and 2: new sequence is [3, 3, 4], sum is 10
- Removing 2 and 3: new sequence is [1, 5, 4], sum is 10
- Removing 3 and 4: new sequence is [1, 2, 7], sum is 10

In all cases, the sum of the remaining sequence is 10.

Example:
- `maximize_sum([1, 2, 3, 4]) == 10`

Implement `maximize_sum(sequence: list[int]) -> int`.
