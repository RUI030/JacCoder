# tasks_completed_and_max_time

Returns the number of tasks that can be performed and the maximum number of seconds used.

Parameters:
queries (list of int): List of seconds to wait for each task to be available.
t (list of int): List of seconds required to complete each task.

Returns:
tuple: (number of tasks that can be performed, maximum seconds used)

>>> tasks_completed_and_max_time([3, 4, 5], [2, 3, 1]) == (3, 6)
>>> tasks_completed_and_max_time([3, 1, 5], [2, 3, 4]) == (2, 6)

Implement `tasks_completed_and_max_time(queries: list[int], t: list[int]) -> tuple[int, int]`.
