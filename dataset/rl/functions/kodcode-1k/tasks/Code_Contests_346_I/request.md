# count_substring_occurrences

Bob has a string `s` composed of lowercase alphabetic characters. Bob wants to find out how many times a given substring appears in the concatenated result of that string after performing k cyclic right shifts. In a cyclic right shift, the last character of the string is moved to the front.

For example:
- If `s` is "abcd" and `k` is 1, the string after 1 cyclic right shift will be "dabc".
- If `s` is "abcd" and `k` is 3, the string after 3 cyclic right shifts will be "bcda".

Help Bob determine the number of occurrences of the given substring in the concatenated result of the strings after performing each of the k cyclic right shifts.

Input

The first line contains an integer k (1 ≤ k ≤ 10^5) — the number of cyclic right shifts.

The second line contains a string s (1 ≤ |s| ≤ 100) — the original string.

The third line contains a string t (1 ≤ |t| ≤ 100) — the substring Bob is looking for.

Output

Print a single integer — the number of times the substring t appears in the concatenated result of the strings after performing each of the k cyclic right shifts.

Examples

Input:
3
abcd
d

Output:
3

Input:
4
abac
ba

Output:
4

Note:

In the first example, the strings after each cyclic right shift are:
- 1 shift: "dabc"
- 2 shifts: "cdab"
- 3 shifts: "bcda"

The concatenated result is "dabccdabbcda" and "d" appears 3 times.

In the second example, the strings after each cyclic right shift are:
- 1 shift: "caba"
- 2 shifts: "acab"
- 3 shifts: "baca"
- 4 shifts: "abac"

The concatenated result is "cabaacabacababac" and "ba" appears 4 times.

Example:
- `count_substring_occurrences(3, 'abcd', 'd') == 3`

Implement `count_substring_occurrences(k: int, s: str, t: str) -> int`.
