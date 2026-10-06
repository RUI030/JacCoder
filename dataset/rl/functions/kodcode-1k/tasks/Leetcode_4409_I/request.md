# trap

You are given a list of non-negative integers representing the heights of a series of vertical bars, where each integer represents the height of a bar at that index. The bars are placed adjacent to each other, so each pair of bars can potentially trap rainwater between them if there is a taller bar on both the left and right sides. Calculate the maximum amount of water that can be trapped after raining.

For example:
- Input: `[0,1,0,2,1,0,1,3,2,1,2,1]`
- Output: `6`

The water trapped is represented by the indices:
- Between indices [1, 3] (1 unit)
- Between indices [4, 7] (6 units total from smaller units of trapped water between intervening bars).

Example:
- `trap([]) == 0`

Implement `trap(height: list[int]) -> int`.
