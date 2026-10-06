# max_subarray_sum

You are working on a secret project where you need to operate on a contiguous block of memory within a large array of integers. To ensure the project meets efficiency requirements, you must determine the maximum sum of the elements within any contiguous subarray of the array.

Given an array of integers (which may include negative numbers), you are to write a program that computes the maximum possible sum for any contiguous subarray.

Input

The first line of input contains a single integer n (1 ≤ n ≤ 10^5) — the number of elements in the array.

The second line contains n integers a_i (-10^4 ≤ a_i ≤ 10^4) — the elements of the array.

Output

Print a single integer — the maximum sum of any contiguous subarray of the given array.

Examples

Input

5
-2 1 -3 4 -1 2 1 -5 4

Output

6

Input

3
1 2 3

Output

6

Input

6
-1 -2 -3 -4 -5 -6

Output

-1

Example:
- `max_subarray_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6`

Implement `max_subarray_sum(nums: list[int]) -> int`.
