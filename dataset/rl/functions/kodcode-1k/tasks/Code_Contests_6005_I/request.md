# max_nut_pieces

You are given a rectangular chocolate bar that can be divided into smaller rectangular pieces. Each piece can be either plain or contain nuts. Your task is to find the maximum number of pieces with nuts you can get by making horizontal and vertical cuts along the grid's lines.

Input

The first line of the input contains two integers n and m (1 ≤ n, m ≤ 50) — the number of rows and columns in the chocolate bar respectively.

The following n lines each contain m integers. A '1' indicates a piece with nuts, and a '0' indicates a plain piece.

Output

Output a single integer — the maximum number of pieces with nuts you can get after making any number of vertical and horizontal cuts along the grid lines.

Example

Input

3 3
1 0 1
0 1 0
1 1 1

Output

3

Input

2 2
1 0
0 1

Output

2

Note

In the first example, the most optimal way to cut the chocolate is:
- Cut along the lines between first and second rows, and second and third rows.
- Cut along the lines between first and second columns, and second and third columns. 

This results in maximum 3 distinct pieces each containing at least one nut.

In the second example, the optimal way is:
- No cuts are necessary, the maximum number of pieces with nuts is already 2.

Example:
- `max_nut_pieces(3, 3, [[1, 0, 1], [0, 1, 0], [1, 1, 1]]) == 6`

Implement `max_nut_pieces(n: int, m: int, grid: list[list[int]]) -> int`.
