# max_total_power

Determine the maximum possible total power for each test case.
Args:
t: Number of test cases.
test_cases: A list of tuples where each tuple contains an integer n and a list of 2n integers representing the power values of stones in each segment.

Returns:
List of integers representing the maximum possible total power for each test case.

>>> max_total_power(2, [(3, [7, 4, 10, 0, 4, 5]), (4, [5, 0, 0, 3, 7, 4, 10, 2])])
[16, 19]

Implement `max_total_power(t: int, test_cases: list[tuple[int, list[int]]]) -> list[int]`.
