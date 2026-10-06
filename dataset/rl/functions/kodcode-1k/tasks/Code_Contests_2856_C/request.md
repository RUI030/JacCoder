# max_path_sum

Find the highest sum of any path from the top-left to the bottom-right corner of the grid
consisting of only right or down movements.
>>> max_path_sum(3, 3, [
...     [1, 2, 3],
...     [4, 5, 6],
...     [7, 8, 9]
... ]) == 29
>>> max_path_sum(3, 3, [
...     [-1, -2, -3],
...     [-4, -5, -6],
...     [-7, -8, -9]
... ]) == -21

Implement `max_path_sum(n: int, m: int, grid: list[list[int]]) -> int`.
