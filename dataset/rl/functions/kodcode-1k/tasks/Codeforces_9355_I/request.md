# min_removals_to_avoid_triplets

You are given a string s consisting of lowercase English letters. Your task is to determine the minimum number of characters you need to remove from the string to form a string that does not contain any three consecutive characters being identical.

The first and only line contains the string s (1 ≤ |s| ≤ 100,000) — the string you need to process.

If it is possible to remove characters to satisfy the condition, output a single integer — the minimum number of characters required to be removed. If the string already satisfies the condition, output 0.

In the first sample test, the input string is "aaabbb". One possible way to achieve the desired string is to remove one 'a' and one 'b', resulting in "aabb", which does not contain any three consecutive identical characters.

In the second sample test, the input string is "abcde". As there are no three consecutive identical characters, the output is 0.

Example:
- `min_removals_to_avoid_triplets('abcde') == 0`

Implement `min_removals_to_avoid_triplets(s: str) -> int`.
