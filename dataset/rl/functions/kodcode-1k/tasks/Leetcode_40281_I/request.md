# count_harmonious_pairs

You are given a list of integers `nums` and an integer `k`. A pair `(i, j)` is considered harmonious if `nums[i] + nums[j] == k` and `i < j`. Return _the number of harmonious pairs in_ `nums`.

Example:
- Input: `nums = [1, 2, 3, 4, 5]`, `k = 5`
- Output: `2`
Explanation:
- The harmonious pairs are (0, 3) and (1, 2).

Example:
- `count_harmonious_pairs([1, 2, 3, 4, 5], 5) == 2`

Implement `count_harmonious_pairs(nums: list[int], k: int) -> int`.
