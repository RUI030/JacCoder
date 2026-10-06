# longest_increasing_subsequence

Given an array of integers, find the length of the longest subsequence that is strictly increasing.

Write a function that takes an array of integers and returns the length of the longest strictly increasing subsequence. You may assume that all elements in the array are distinct.

Constraints

* $1 \leq arr.length \leq 1000$
* $-10^4 \leq arr[i] \leq 10^4$

Input

An array of integers.

Output

Print the length of the longest strictly increasing subsequence.

Example

Input

[10, 9, 2, 5, 3, 7, 101, 18]

Output

4

Explanation

The longest increasing subsequence is [2, 3, 7, 101], so the output is 4.

Example:
- `longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18]) == 4`

Implement `longest_increasing_subsequence(arr: list[int]) -> int`.
