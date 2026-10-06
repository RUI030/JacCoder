# segment_avg

**Objective:**
Write a Jac function named `segment_avg(data, k)` that accepts a list of integers `data` and an integer `k`, and returns a list of the average values of each contiguous sub-list of length `k` in the input list.

**Details:**
1. The input to the function `segment_avg(data, k)` is a list of integers `data` and an integer `k`.
2. Compute the average of each contiguous sub-list of length `k` in the input list.
3. Return a list of these average values.

**Requirements:**
- Ensure the function returns an empty list if the length of `data` is less than `k`.
- Use Python's built-in functions and methods for computations.
- Make sure to handle edge cases such as negative numbers and zero values in the input list.

**Example:**
Suppose the input list is `[1, 2, 3, 4, 5]` and `k` is `3`. The function should return `[2.0, 3.0, 4.0]` since the averages of the sub-lists of length `3` are `(1+2+3)/3 = 2`, `(2+3+4)/3 = 3`, and `(3+4+5)/3 = 4`.

Example:
- `segment_avg([1, 2, 3, 4, 5], 3) == [2.0, 3.0, 4.0]`

Implement `segment_avg(data: list[int], k: int) -> list[float]`.
