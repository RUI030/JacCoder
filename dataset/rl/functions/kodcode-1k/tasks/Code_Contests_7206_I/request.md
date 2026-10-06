# longest_balanced_substring

Balanced Substring

Problem Statement

Given a string `s` consisting of only the characters 'A' and 'B', determine the length of the longest substring that contains an equal number of 'A's and 'B's.

Input

The input consists of:

A single line containing the string `s` (1 ≤ |s| ≤ 10^5).

Output

Output a single integer denoting the length of the longest balanced substring.

Example Input 1

AABBAB

Example Output 1

6

Example Input 2

AAABB

Example Output 2

4

Example Input 3

AAAA

Example Output 3

0

Explanation

In the first example, the entire string "AABBAB" contains an equal number of 'A's and 'B's, so the output is 6.

In the second example, the substring "AABB" is the longest substring containing an equal number of 'A's and 'B's, so the output is 4.

In the third example, there is no substring that contains an equal number of 'A's and 'B's, so the output is 0.

Constraints

- `1 ≤ |s| ≤ 10^5`
- `s` consists only of characters 'A' and 'B'.

Example:
- `longest_balanced_substring('AABBAB') == 6`

Implement `longest_balanced_substring(s: str) -> int`.
