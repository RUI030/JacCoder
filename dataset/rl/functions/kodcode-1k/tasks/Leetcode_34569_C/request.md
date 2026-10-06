# max_swaps_to_balance

You are given a 0-indexed integer array `nums` consisting of `n` elements, where `n` is even. 
The array is called well-balanced if the sum of the even-indexed elements equals the sum of the odd-indexed elements.
You are allowed to perform at most one swap between an even-indexed element and an odd-indexed element. 
Return the maximum possible number of such swaps that can be performed on `nums` so that the array becomes well-balanced.
If the array is already well-balanced, return 0.

>>> max_swaps_to_balance([1, 1, 1, 1])
0
>>> max_swaps_to_balance([1, 2, 3, 4])
1

Implement `max_swaps_to_balance(nums: list[int]) -> int`.
