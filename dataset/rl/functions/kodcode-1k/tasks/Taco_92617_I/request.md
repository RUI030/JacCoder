# is_square_free

Alice wants to write a program that can classify integers based on their properties. In particular, she wants to determine whether a number is square-free. A square-free number is an integer which is not divisible by any square number other than 1 (i.e., it has no square factors other than 1).

-----Input-----
The input consists of a single integer `n` (1 ≤ n ≤ 10^6).

-----Output-----
The output should be a single string "YES" if the number is square-free and "NO" otherwise.

-----Examples-----
Input
10

Output
YES

Input
18

Output
NO

Input
25

Output
NO

-----Note-----
For example, 10 is square-free because its divisors (1, 2, 5, and 10) do not include any square numbers (other than 1). However, 18 is not square-free because it is divisible by 9 (a square number). Similarly, 25 is not square-free because it is divisible by 25.

Example:
- `is_square_free(10) == 'YES'`

Implement `is_square_free(n: int) -> str`.
