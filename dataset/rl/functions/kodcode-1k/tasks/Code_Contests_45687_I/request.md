# is_special_number

Given an integer n, you are required to determine whether n is a special number. A special number has the characteristic that it can be expressed as the sum of squares of two non-negative integers a and b, i.e., it can be represented as n = a^2 + b^2.

Write a program to determine if a given number n is special or not. If it is special, print "YES". Otherwise, print "NO".

Input

The input consists of a single integer n (1 ≤ n ≤ 10^6).

Output

Output "YES" if n can be expressed as the sum of squares of two non-negative integers, otherwise print "NO".

Examples

Input

5

Output

YES

Input

3

Output

NO

Note

In the first example, the number n = 5 can be expressed as the sum of squares of 1 and 2 (1^2 + 2^2 = 5), so the output is "YES".

In the second example, the number n = 3 cannot be expressed as the sum of squares of any two non-negative integers, so the output is "NO".

Example:
- `is_special_number(5) == 'YES'`

Implement `is_special_number(n: int) -> str`.
