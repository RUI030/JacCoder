# min_cost_to_equal_heights

You are given n integers in the array x, where xi represents the height of the i-th toy structure arranged in a line. You are allowed to modify the height of the toy structures. In one operation, you can increase or decrease the height of any toy structure by 1. 

The cost of each operation is 1 unit.

Your goal is to make all the toy structures have the same height after the minimum number of operations. Determine this minimum cost for a given array of toy structure heights.

Input

The first line of input contains a single integer n (1 ≤ n ≤ 105), the number of toy structures. The second line contains n integers x1, x2, ..., xn (0 ≤ xi ≤ 109), where xi is the height of the i-th toy structure.

Output

Output a single integer — the minimum total cost of making all toy structures the same height.

Examples

Input

5
3 1 2 2 1

Output

3

Input

3
5 9 15

Output

10

Example:
- `min_cost_to_equal_heights(5, [3, 1, 2, 2, 1]) == 3`

Implement `min_cost_to_equal_heights(n: int, heights: list[int]) -> int`.
