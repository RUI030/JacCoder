# count_subarrays_with_sum

You are given an integer array arr of length n which contains positive integers. Your task is to determine the number of non-empty contiguous subarrays such that the sum of the subarray is equal to a given integer k.

A subarray is a contiguous part of an array.

The first line contains two integers n and k (1 ≤ n ≤ 10000, |k| ≤ 10^7) — the length of the array and the target sum k.

The second line contains n integers arr1, arr2, ..., arrn (1 ≤ arri ≤ 1000) — the elements of the array.

Print the number of non-empty contiguous subarrays whose sum is equal to k.

For example, given the array [1, 1, 1] with k = 2, there are two subarrays that sum to 2: [1, 1] (starting at index 0 and ending at index 1) and [1, 1] (starting at index 1 and ending at index 2).

Example:
- `count_subarrays_with_sum([3], 3) == 1`

Implement `count_subarrays_with_sum(arr: list[int], k: int) -> int`.
