# find_error_nums

You are given a `0-indexed` array of integers `nums` of length `n` where each element ranges from `1` to `n`. Each integer in `nums` appears **exactly** once except for a single integer `x` which appears **twice**, and one integer in the range `[1, n]` is missing. 

You need to find the integer that is missing and the integer that appears twice. Return these two integers in a tuple of the form `(duplicate, missing)`.

Example:
- `find_error_nums([1, 2, 2, 4]) == (2, 3)`

Implement `find_error_nums(nums: list[int]) -> tuple[int, int]`.
