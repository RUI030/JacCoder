# subarray_sum_exists

Given an array of integers, you need to determine whether there exists a contiguous subarray (of size at least one) that sums to a given number k.

The input consists of:
1. An integer n (1 <= n <= 10^5) representing the size of the array.
2. An integer k (|k| <= 10^9) representing the target sum.
3. An array of n integers where each integer ai (|ai| <= 10^6).

The output should be "YES" if there exists a contiguous subarray that sums to k, and "NO" otherwise.

Example:

Input:
5
10
4 3 -2 4 5

Output:
YES

Input:
3
8
1 2 3

Output:
NO

Note:
1. You are allowed to use any algorithmic approach to solve this problem, but the solution must be efficient enough to handle the upper limits of input constraints.
2. Think about edge cases, such as all elements being negative, or the value of k being 0.

Example:
- `subarray_sum_exists(5, 10, [4, 3, -2, 4, 5]) == 'YES'`

Implement `subarray_sum_exists(n: int, k: int, arr: list[int]) -> str`.
