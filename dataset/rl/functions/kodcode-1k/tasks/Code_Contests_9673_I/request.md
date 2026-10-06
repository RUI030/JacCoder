# is_rotation

You are given two strings, `s1` and `s2`. Your task is to determine if one string is a rotation of the other. A string is considered a rotation of another string if it can become the other string by performing some number of shifts (rotations) of its characters.

Constraints

* 1 ≤ |s1|, |s2| ≤ 1000
* s1 and s2 contain only lowercase English letters.

Input

Two strings `s1` and `s2`.

Output

Print "YES" if one string is a rotation of the other, otherwise print "NO".

Examples

Input

abcd
dabc

Output

YES

Input

hello
lohel

Output

YES

Input

abc
acb

Output

NO

Input

abcd
abdc

Output

NO

Example:
- `is_rotation('abcd', 'dabc') == 'YES'`

Implement `is_rotation(s1: str, s2: str) -> str`.
