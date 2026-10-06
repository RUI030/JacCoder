# min_trails

Calculate the minimum number of trails a team needs to complete
to meet the required difficulty points and checkpoints.

If it's not possible, return -1.

>>> min_trails(3, 8, 7, [(4, 5), (2, 4), (6, 3)]) == 2
>>> min_trails(2, 10, 10, [(1, 1), (2, 2)]) == -1

Implement `min_trails(t: int, d: int, c: int, trails: list[tuple[int, int]]) -> int`.
