# calculate_influence_scores

Calculates the influence scores for each user based on mutual connections.

Parameters:
N (int): Number of users.
M (int): Number of mutual connections.
connections (list of tuples): Each tuple contains two integers representing a mutual connection.

Returns:
list: A list of N integers representing the influence scores of each user.

Example:
>>> calculate_influence_scores(5, 4, [(1, 2), (1, 3), (2, 3), (4, 5)])
[2, 2, 2, 1, 1]

>>> calculate_influence_scores(1, 0, [])
[0]

Implement `calculate_influence_scores(N: int, M: int, connections: list[tuple[int, int]]) -> list[int]`.
