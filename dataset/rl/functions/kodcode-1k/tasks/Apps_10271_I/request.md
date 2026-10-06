# rearrange_unique_sorted

Design an algorithm to rearrange an array nums such that:

- Each element in nums appears exactly once in the output array.
- The output array is sorted in non-decreasing order.
- Any subsequence of the original array containing only unique elements is also a subsequence of the output array.

If multiple solutions exist, return any of them.

Example 1:
Input: nums = [4,3,2,4,1,3,2]
Output: [1,2,3,4]

Example 2:
Input: nums = [2,1,2,1,2,1]
Output: [1,2]

Example 3:
Input: nums = [6,5,4,4,5,6]
Output: [4,5,6]

Example 4:
Input: nums = [1,2,3,4,5]
Output: [1,2,3,4,5]

Note:
- The length of nums will be in the range [1, 10000].
- Each element of nums is an integer in the range [0, 10000].

Example:
- `rearrange_unique_sorted([4, 3, 2, 4, 1, 3, 2]) == [1, 2, 3, 4]`

Implement `rearrange_unique_sorted(nums: list[int]) -> list[int]`.
