# max_contiguous_subarray_sum

You are given an array of integers and a single integer k. Your task is to determine whether there exists a contiguous subarray of size k with the highest possible sum. 

An array is called contiguous if all the elements within it are adjacent to each other in the original array. 

The function should return the highest sum of any contiguous subarray of size k. If there are no subarrays of size k, return -1.

Input

- The first line contains two integers n and k (1 ≤ n ≤ 10^5, 1 ≤ k ≤ n) — the size of the array and the size of the subarray you have to find.
- The second line contains n space-separated integers ai (-10^4 ≤ ai ≤ 10^4) — the elements of the array.

Output

Output a single integer — the largest sum of any contiguous subarray of size k. If no such subarray can be found, return -1.

Examples

Input

8 3
5 2 -1 0 3 12 6 -3

Output

21

Input

4 2
-1 -2 -3 -4

Output

-3

Note

In the first example, the subarray with the largest sum of size 3 is [3, 12, 6], and its sum is 21.

In the second example, the subarray with the largest sum of size 2 is [-1, -2], and its sum is -3.

Example:
- `max_contiguous_subarray_sum(8, 3, [5, 2, -1, 0, 3, 12, 6, -3]) == 21`

Implement `max_contiguous_subarray_sum(n: int, k: int, arr: list[int]) -> int`.
