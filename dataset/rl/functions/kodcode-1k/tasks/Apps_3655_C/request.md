# unique_paths_with_obstacles

Calculate the number of unique paths from the top-left to the bottom-right corner of a grid with obstacles.
Args:
grid (List[List[int]]): The obstacle grid.

Returns:
int: The number of unique paths.

Examples:
>>> unique_paths_with_obstacles([
...     [0, 0, 0],
...     [0, 1, 0],
...     [0, 0, 0]
... ])
2
>>> unique_paths_with_obstacles([
...     [0, 1],
...     [0, 0]
... ])
1

Implement `unique_paths_with_obstacles(grid: list[list[int]]) -> int`.
