# max_subarray_sum

You are provided with a list of integers, and you need to find the maximum sum of a contiguous subarray within this list. Implement a function called `max_subarray_sum(arr)` that computes this using Kadane’s algorithm.

Your function should:
1. Take a list of integers `arr` as input.
2. Initialize two variables, `max_current` and `max_global`. Set both to the first element of the array.
3. Iterate through each element of the array starting from the second element.
4. Update `max_current` to be the maximum of the current element itself and the sum of `max_current` and the current element.
5. If `max_current` is greater than `max_global`, update `max_global` to be `max_current`.
6. Return the value of `max_global`, which represents the largest sum of the contiguous subarray.

Assume the input list `arr` has at least one element and contains both positive and negative integers. Python’s built-in `max` function is essential for this task.

Example:
- `max_subarray_sum([1, 2, 3, 4, 5]) == 15`

Implement `max_subarray_sum(arr: list[int]) -> int`.
