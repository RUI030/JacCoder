# numDistinct

You are given a string `s` consisting of lowercase English letters. A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters. For example, "ace" is a subsequence of "abcde" while "aec" is not. Given a string `t`, return the number of distinct subsequences of `s` which equals `t`. The answer can be very large, so return it modulo `10^9 + 7`.

Example:
- `numDistinct('rabbbit', 'rabbit') == 3`

Implement `numDistinct(s: str, t: str) -> int`.
