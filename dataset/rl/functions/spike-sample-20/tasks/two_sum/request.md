# Find two indices that sum to a target

Implement `two_sum(nums: list[int], target: int) -> list[int]`. Return `[i, j]`
with `i < j` and `nums[i] + nums[j] == target`. If several pairs exist, return the
one with the smallest `j`, and for that `j` the smallest `i`. Return `[]` when no
pair exists.

Example:
- `two_sum([2, 7, 11, 15], 9) == [0, 1]`
