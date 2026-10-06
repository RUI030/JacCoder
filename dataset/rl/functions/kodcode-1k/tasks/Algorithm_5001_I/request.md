# unique_paths

### Unique Path Counter

#### Problem Statement:
You are given a `m x n` grid representing a map where the top-left corner is the starting point and the bottom-right corner is the destination. You can only move either down or right at any point in time. Your task is to count how many unique paths exist from the top-left corner to the bottom-right corner of the grid.

Write a function `unique_paths(m: int, n: int) -> int` that receives the integers `m` and `n` representing the number of rows and columns of the grid, respectively, and returns the number of unique paths from the top-left corner to the bottom-right corner.

### Input:
* Two integers `m` and `n` where `1 <= m, n <= 100`.

### Output:
* Returns an integer representing the number of unique paths from the top-left corner to the bottom-right corner.

### Constraints:
* You may only move either down or right at any point in time.
* The grid size will always be positive.

### Example:
1. `unique_paths(3, 7)` should return `28`
2. `unique_paths(3, 2)` should return `3`
3. `unique_paths(7, 3)` should return `28`
4. `unique_paths(3, 3)` should return `6`
5. `unique_paths(1, 1)` should return `1`

#### Additional Notes:
* Consider using dynamic programming to optimize your solution for larger grids.
* The problem can also be solved using combinatorics, leveraging the binomial coefficient.

Example:
- `unique_paths(3, 7) == 28`

Implement `unique_paths(m: int, n: int) -> int`.
