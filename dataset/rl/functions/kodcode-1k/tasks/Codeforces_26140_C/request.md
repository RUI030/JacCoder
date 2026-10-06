# find_max_square_subgrid

Given a rectangular grid with dimensions n x m, where each cell has a value of either 0 or 1,
returns the size of the largest square sub-grid containing only 1's.

>>> find_max_square_subgrid(4, 5, ["10111", "10111", "11111", "10010"])
3
>>> find_max_square_subgrid(3, 3, ["111", "111", "111"])
3

Implement `find_max_square_subgrid(n: int, m: int, grid: list[str]) -> int`.
