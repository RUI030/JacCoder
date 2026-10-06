# is_valid_schedule

Write a function `is_valid_schedule` that determines if a given list of task intervals can all be scheduled without overlap. The function should receive a list of tuples, where each tuple contains two integers representing the start and end times of a task, and return `True` if no tasks overlap, or `False` otherwise. The tasks are provided in no particular order.
Example:
- Input: [(1, 3), (2, 5), (4, 6)]
- Output: False

- Input: [(1, 2), (3, 5), (6, 8)]
- Output: True

Example:
- `is_valid_schedule([]) == True`

Implement `is_valid_schedule(tasks: list[tuple[int, int]]) -> bool`.
