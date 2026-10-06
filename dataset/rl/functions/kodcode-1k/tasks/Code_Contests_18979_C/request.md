# max_employees_logged_in

Determines the maximum number of employees that were logged in at the same time.

Args:
n (int): The number of log-in sessions recorded for the day.
intervals (List[Tuple[int, int]]): A list of tuples where each tuple contains the login and logout times of an employee.

Returns:
int: The maximum number of employees logged into the chat server simultaneously.

Examples:
>>> max_employees_logged_in(5, [(1, 4), (2, 6), (4, 7), (5, 8), (6, 9)])
3
>>> max_employees_logged_in(4, [(3, 5), (1, 2), (4, 6), (5, 7)])
2

Implement `max_employees_logged_in(n: int, intervals: list[tuple[int, int]]) -> int`.
