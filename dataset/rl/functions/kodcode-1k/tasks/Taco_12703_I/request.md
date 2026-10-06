# max_non_adjacent_sum

Bob likes playing with arrays and has a game he made up involving summing non-adjacent elements. Given an integer array `nums`, he defines the maximum sum of a subset of its elements such that no two elements in the subset are adjacent in the array. 

For example, if `nums = [3, 2, 5, 10, 7]`, the possible subsets that satisfy the non-adjacent condition could be `[3, 5, 7]`, `[3, 10]`, `[2, 10]`, etc., and the subset `[3, 10]` gives the maximum sum of `13`.

Given an array `nums` of length `n` where $(1 \leq n \leq 100)$, Bob wants to know the maximum sum he can get from any non-adjacent subset of elements.


-----Input-----

The first line contains an integer $n$ $(1 \leq n \leq 100)$, the size of the array.

The second line contains $n$ integers $nums[i]$ $(1 \leq nums[i] \leq 1000)$ representing the elements of the array.


-----Output-----

Print a single integer, the maximum sum Bob can get from a non-adjacent subset.


-----Examples-----
Input
5
3 2 5 10 7

Output
15

Input
3
2 1 4

Output
6

-----Note-----

In the first example, the subset `[3, 5, 7]` provides the maximum sum `3 + 12 + 0 + 2 = 15`.

In the second example, the subset `[2, 4]` gives the maximum sum `2 + 4 = 6`.

Example:
- `max_non_adjacent_sum([5]) == 5`

Implement `max_non_adjacent_sum(nums: list[int]) -> int`.
