# distinct_string_after_k_operations

Alex has a collection of strings, and he likes to play with them by transforming and combining them in various ways. Today, he found a new way to play with his strings. Given a string, he wants to perform the following operation exactly k times:

1. Select any character in the string and remove it.
2. Append the removed character back to either end of the string.

After performing k operations, Alex wants to know how many distinct strings he can obtain. Can you help him find the answer?

The first line contains two integers n and k (1 ≤ n ≤ 1000, 1 ≤ k ≤ 1000) — the length of the string and the number of operations, respectively.

The second line contains a string s of length n consisting of lowercase English letters.

Print a single integer — the number of distinct strings possible after exactly k operations.

In the first sample, the original string is "ab". After one operation, it could become "ba" (moving 'a' to the end) or remain "ab" (moving 'b' to the start).

In the second sample, the original string is "abc". After two operations, the string can have multiple different forms like "bca", "cab", "abc", etc.

Example:
- `distinct_string_after_k_operations(2, 1, 'ab') == 2`

Implement `distinct_string_after_k_operations(n: int, k: int, s: str) -> int`.
