# min_operations_to_crumble

You are given a wall with \( n \) bricks arranged in a row. Each brick has a number written on it representing its strength. Each day, a construction worker can perform one of the following two operations:

1. Choose any brick and decrease its strength by one unit (if the strength is positive).
2. If two adjacent bricks have the same strength greater than zero, he can merge them into a single brick. The new brick's strength will be equal to the sum of the two original bricks' strengths.

The worker wants to know the minimum number of operations required to make the wall crumble, which means making the strength of all bricks zero.

Write a program to calculate the minimum number of operations needed.

Input

The first line contains a single integer \( n \) (\( 1 \leq n \leq 10^5 \)) — the number of bricks.

The second line contains \( n \) integers \( a_1, a_2, \ldots, a_n \) (\( 1 \leq a_i \leq 10^4 \)) — the strengths of the bricks.

Output

Output a single integer — the minimum number of operations required to make all bricks' strength zero.

Examples

Input

3
2 2 1

Output

4

Input

5
3 1 4 1 5

Output

14

Note

In the first example, the worker can perform the following operations:

1. Merge the first two bricks (strengths 2 and 2) into a brick of strength 4.
2. Decrease the strength of the brick (strength 4) four times.

In the second example, the worker needs to perform the following operations:

1. Decrease the strength of the first brick (strength 3) three times.
2. Decrease the strength of the second brick (strength 1) one time.
3. Decrease the strength of the third brick (strength 4) four times.
4. Decrease the strength of the fourth brick (strength 1) one time.
5. Decrease the strength of the fifth brick (strength 5) five times.

Example:
- `min_operations_to_crumble(3, [2, 2, 1]) == 5`

Implement `min_operations_to_crumble(n: int, strengths: list[int]) -> int`.
