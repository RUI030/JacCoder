# max_balance

You are given an array of n integers. We define the "balance" of a subarray as the absolute difference between the number of even and odd numbers in that subarray.

You need to find out the maximum balance of any subarray of the given array.

The first line of the input contains an integer n (1 ≤ n ≤ 100,000) — the length of the array.

The second line contains n integers a1, a2, ..., an (1 ≤ ai ≤ 100,000) — the elements of the array.

Print the only integer — the maximum balance of any subarray of the given array.

In the first sample, the highest balance is achieved with subarray [4, 5] or [6, 3].

In the second sample, the highest balance is achieved with subarray [2, 6, 9].

Example:
- `max_balance([4, 5, 6, 3, 8]) == 1`

Implement `max_balance(arr: list[int]) -> int`.
