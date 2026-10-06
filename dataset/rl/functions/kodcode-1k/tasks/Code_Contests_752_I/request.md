# max_wood_pieces

Given a list of integers representing the heights of trees in a forest, your objective is to collect the maximum number of wood pieces by cutting down some trees. Each tree can either be cut down or left as is. When a tree is cut down, you collect a single wood piece if its height is an even number.

However, there's a condition: no two adjacent trees can be cut down. Your task is to determine the maximum number of wood pieces you can collect by cutting down the optimal set of trees following the aforementioned condition.

Input

The first line contains an integer n (1 ≤ n ≤ 100) — the number of trees in the forest.

The second line contains n integers h_1, h_2, ..., h_{n} (1 ≤ h_i ≤ 1000) — the heights of the trees.

Output

The first line should contain the maximum number of wood pieces you can collect.

Examples

Input

7
4 7 2 8 6 10 1

Output

3

Input

5
3 5 7 9 11

Output

0

Note

In the first example, the optimal strategy is to cut down trees at heights 4, 8, and 10, collecting 3 wood pieces. No two adjacent trees are cut down.

In the second example, all trees have odd heights, so no wood pieces can be collected, resulting in an output of 0.

Example:
- `max_wood_pieces(7, [4, 7, 2, 8, 6, 10, 1]) == 3`

Implement `max_wood_pieces(n: int, heights: list[int]) -> int`.
