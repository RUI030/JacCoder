# can_rearrange_students

You are given a list of integers representing the heights of students in a classroom. Your task is to determine if the students can be rearranged in such a way that every student taller than the preceding one. The list should not contain two students of the same height.

Input

The first line contains an integer n (1 ≤ n ≤ 100) — the number of students.

The second line contains n integers h1, h2, ..., hn (1 ≤ hi ≤ 1000) — the heights of the students.

Output

Print "NO" if it is not possible to rearrange the students to meet the requirements. Otherwise, print "YES".

Examples

Input

5
1 3 2 4 5

Output

YES

Input

3
5 3 5

Output

NO

Note

In the first example, the heights can be rearranged to form a strictly increasing sequence: 1, 2, 3, 4, 5.

In the second example, the heights cannot be rearranged to form a strictly increasing sequence because the height '5' appears more than once.

Example:
- `can_rearrange_students(5, [1, 3, 2, 4, 5]) == 'YES'`

Implement `can_rearrange_students(n: int, heights: list[int]) -> str`.
