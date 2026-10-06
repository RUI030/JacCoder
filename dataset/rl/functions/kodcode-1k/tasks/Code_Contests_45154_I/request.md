# largest_even_number

You are given a set of integers, and you are required to rearrange them to form the largest possible even number. The number must be valid, meaning it must not contain leading zeros unless the entire number is zero. If it is not possible to form an even number, return -1.

Input

The first line contains an integer n (1 ≤ n ≤ 10^5) — the number of elements in the set.

The second line contains n integers ai (0 ≤ ai ≤ 9) — the elements of the set.

Output

Print the largest possible even number that can be formed, or -1 if it is not possible to form an even number.

Examples

Input

4
1 2 3 4

Output

4312

Input

3
3 5 9

Output

-1

Input

5
0 1 2 5 8

Output

85210

Note

In the first sample, the largest possible even number is 4312.

In the second sample, it is impossible to form an even number with the given digits, so the output is -1.

In the third sample, the largest possible even number is 85210.

Example:
- `largest_even_number(4, [1, 2, 3, 4]) == 4312`

Implement `largest_even_number(n: int, elements: list[int]) -> int`.
