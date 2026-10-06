# unique_paths

Calculates the number of unique paths from the top-left corner to the bottom-right corner
of an m x n grid. You can only move either down or right at any point in time.

Parameters:
m (int): number of rows (1 <= m <= 100)
n (int): number of columns (1 <= n <= 100)

Returns:
int: total number of unique paths

>>> unique_paths(3, 7)
28
>>> unique_paths(3, 2)
3

Implement `unique_paths(m: int, n: int) -> int`.
