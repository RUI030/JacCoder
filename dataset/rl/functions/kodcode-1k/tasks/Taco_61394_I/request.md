# can_form_rectangle

You have recently found a new hobby in solving jigsaw puzzles. You decided to write a program to determine if a set of jigsaw puzzle pieces can be assembled to form a valid rectangle.

Each puzzle piece is represented by a pair (width, height). You are given 'n' puzzle pieces. Your task is to determine if these pieces can be assembled to form a valid rectangle.

-----Input-----

The first line of input contains a single integer 'n' (1 ≤ n ≤ 100), the number of puzzle pieces.

Each of the following 'n' lines contains two space-separated integers w_i and h_i (1 ≤ w_i, h_i ≤ 1000) representing the dimensions of each puzzle piece (width and height).

-----Output-----

Output "YES" (quotes for clarity) if the pieces can form a valid rectangle, otherwise output "NO".

-----Examples-----

Input
4
2 4
4 2
4 2
2 4

Output
YES

Input
3
1 2
2 1
2 2

Output
NO

Input
6
1 2
2 3
2 1
3 4
2 1
1 3

Output
NO

-----Note-----

In the first sample, you can pair up the pieces as (2x4) and (4x2), and they can form a valid rectangle of dimensions 4x4 or 2x8.

In the second sample, with only 3 pieces, it is impossible to form a rectangle.

In the third sample, the pieces do not match properly to form any valid combination of rectangles.

Example:
- `can_form_rectangle(4, [(2, 4), (4, 2), (4, 2), (2, 4)]) == 'YES'`

Implement `can_form_rectangle(n: int, pieces: list[tuple[int, int]]) -> str`.
