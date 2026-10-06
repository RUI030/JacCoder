# smallest_sequence_after_k_steps

You are given a list of integers `heights` representing the heights of the students in a class, arranged in a line from left to right. You are also given an integer `k`, which represents the number of steps you can make. In one step, you can pick any student from the line and move them to any position within the same line, rearranging the order of the heights. Your task is to determine the lexicographically smallest sequence of heights possible after performing exactly `k` steps. Return the lexicographically smallest list of heights after `k` steps.

Example:
- `smallest_sequence_after_k_steps([1, 2, 3, 4, 5], 0) == [1, 2, 3, 4, 5]`

Implement `smallest_sequence_after_k_steps(heights: list[int], k: int) -> list[int]`.
