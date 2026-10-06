# maxCoins

Determine the maximum number of coins you can collect if you start from the top-left corner of 
the matrix and move to the bottom-right corner. You can only move either right or down at each step.

>>> maxCoins([
...     [0, 3, 1, 1],
...     [2, 0, 0, 4],
...     [1, 5, 3, 1]
... ])
12

>>> maxCoins([[5]])
5

Implement `maxCoins(matrix: list[list[int]]) -> int`.
