# max_length_subarray

Given an array of `n` unique integers, find the **maximum length** of a contiguous subarray where the difference between the minimum and maximum element is at most `k`. A contiguous subarray is a subarray that appears consecutively within the original array. For example, the array `[10, 1, 2, 4, 7, 2]` with `k = 5` has a subarray `[4, 7, 2]` where the difference between the maximum and minimum element is `5`, and the length of this subarray is `3`. Return the length of the longest possible subarray that meets the given condition.

Example:
- `max_length_subarray([], 5) == 0`

Implement `max_length_subarray(nums: list[int], k: int) -> int`.
