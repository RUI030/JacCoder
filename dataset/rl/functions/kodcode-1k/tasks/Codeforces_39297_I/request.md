# max_removable_bricks

Polycarp is trying to impress his friends by performing some magic tricks with bricks. He has a rectangle grid of n rows and m columns made up of bricks. Each brick has a height of 1 and a width of 1. Initially, all bricks are perfectly aligned in the grid. To perform his trick, Polycarp wants to remove some bricks such that they form a special pattern in the grid. For this pattern, each brick must have another brick either directly above it, directly below it, or directly to the left or right of it at each step.

Given the dimensions of the grid, determine the maximum number of bricks Polycarp can remove from the grid while making sure every remaining brick still has a neighboring brick in any of the indicated directions. 

The input consists of two integers n and m (1 ≤ n, m ≤ 1000) - the number of rows and columns in the grid.

Output a single integer - the maximum number of bricks that Polycarp can remove while ensuring every remaining brick has at least one neighboring brick directly adjacent to it.

For example, for an input of n=3 and m=4, the output would be the maximum number of bricks that can be removed while meeting the requirement.

Example:
- `max_removable_bricks(3, 4) == 6`

Implement `max_removable_bricks(n: int, m: int) -> int`.
