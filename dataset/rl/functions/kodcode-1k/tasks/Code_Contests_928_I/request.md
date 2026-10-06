# are_permutations

Given two strings, write a function that determines if one string is a permutation of the other. A permutation is a rearrangement of the characters in the string. The function should return True if the two strings are permutations of each other and False otherwise.

Input

Two space-separated strings.

Output

A single boolean value, either True or False.

Constraints

* The input strings will only contain printable ASCII characters.
* The length of the strings will be between 1 and 100,000.

Examples

Input

abcd bcda

Output

True

Input

abcde edcba

Output

True

Input

abcd efg

Output

False

Input

xyz abc

Output

False

Example:
- `are_permutations('abcd', 'bcda') == True`

Implement `are_permutations(str1: str, str2: str) -> bool`.
