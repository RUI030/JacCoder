# minimize_absolute_difference

You are given an array of n integers a_1, a_2, ..., a_n. Your task is to rearrange the elements in such a way that the absolute difference between any two adjacent elements is minimized.

-----Input-----
The first line contains a single integer n (2 ≤ n ≤ 10^5) — the number of elements in the array. 
The second line contains n integers a_1, a_2, ..., a_n (|a_i| ≤ 10^9) — the elements of the array.

-----Output-----
The output should be a single line with n integers: the rearranged array such that the absolute difference between any two adjacent elements is minimized. If there are several valid rearrangements, print any of them.

-----Examples-----
Input
4
3 2 1 4

Output
1 2 3 4

Input
5
10 5 3 9 1

Output
1 3 5 9 10

Example:
- `minimize_absolute_difference(4, [3, 2, 1, 4]) == [1, 2, 3, 4]`

Implement `minimize_absolute_difference(n: int, array: list[int]) -> list[int]`.
