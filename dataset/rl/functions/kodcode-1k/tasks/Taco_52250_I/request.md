# count_distinct_in_subarrays

Given an array of n integers and a number k, return the count of distinct integers in every contiguous subarray of length k.

-----Input-----
The first line of the input contains two integers n and k (1 ≤ k ≤ n ≤ 100,000), representing the length of the array and the size of the subarray respectively. The second line contains n space-separated integers a_1, a_2, ..., a_n (1 ≤ a_i ≤ 100,000), representing the elements of the array.

-----Output-----
Print a single line containing n-k+1 integers, where the i-th integer represents the count of distinct numbers in the subarray starting from index i.

-----Examples-----
Input
7 4
1 2 1 3 4 2 3
Output
3 4 4 3

Input
5 3
4 1 1 3 4
Output
2 2 3

Example:
- `count_distinct_in_subarrays([1, 2, 1, 3, 4, 2, 3], 7, 4) == [3, 4, 4, 3]`

Implement `count_distinct_in_subarrays(arr: list[int], n: int, k: int) -> list[int]`.
