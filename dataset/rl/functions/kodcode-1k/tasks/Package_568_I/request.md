# unique_paths

**Context:**
You are working on a function to help a robotic vacuum cleaner navigate a rectangular grid. The robot starts at the top-left corner of the grid and can move either right or down. The goal is to find the number of unique paths the robot can take to reach the bottom-right corner of the grid.

**Requirements:**

1. The function `unique_paths(m: int, n: int) -> int` should calculate the number of unique paths for a grid with `m` rows and `n` columns.
2. The robot can only move to the right or down at any point in time.
3. Utilize dynamic programming to optimize the solution.

**Algorithm:**
- Use a 2D list to store the number of paths to each cell.
- The number of ways to get to a cell `(i, j)` is the sum of the number of ways to get to the cell directly above it `(i-1, j)` and the cell directly to the left of it `(i, j-1)`.

**Example:**
- `unique_paths(3, 7)` should return `28` because there are 28 different ways for the robot to navigate a 3x7 grid.
- `unique_paths(3, 2)` should return `3` because there are 3 different ways for the robot to navigate a 3x2 grid.

**Hint:**
- Initialize the first row and first column of the 2D list with `1`, as there's only one way to reach any cell in the first row or column—from the left for the first row and from above for the first column.

**Note:**
- If `m` or `n` is `1`, then the number of unique paths is `1` since the robot can only follow one path all the way across the grid.

Example:
- `unique_paths(3, 7) == 28`

Implement `unique_paths(m: int, n: int) -> int`.
