# least_interval

Determine the minimum time required to complete all given tasks with cooling periods.

Args:
tasks (list): A list of characters representing tasks.
n (int): The cooling period between the same tasks.

Returns:
int: The minimum intervals required to execute all the tasks with the given cooling period.

Examples:
>>> least_interval(['A', 'A', 'A', 'B', 'B', 'B'], 2)
8

>>> least_interval(['A', 'A', 'A', 'B', 'B', 'B'], 0)
6

Implement `least_interval(tasks: list[str], n: int) -> int`.
