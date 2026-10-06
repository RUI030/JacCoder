# is_isomorphic_advanced

Write a function `is_isomorphic_advanced(s, t)` to determine if two strings `s` and `t` are isomorphic. Two strings are isomorphic if the characters in one string can be replaced to get the other string while preserving the character order. Each character in the original string must map to exactly one character in the other string, and no two characters can map to the same character, but a character may map to itself.

#### Input:
- Two strings, `s` and `t`, both with lengths between 0 and 10^4.

#### Output:
- Return `True` if the strings `s` and `t` are isomorphic.
- Return `False` otherwise.

#### Constraints:
- The function should handle and return appropriate results for edge cases such as empty strings.
- Ensure efficient use of space and time.

#### Scenario:

Imagine you're building a system that checks whether two encoding schemes are exactly the same in terms of character relationships. This function could be a critical component of such a system. Consider optimizing the function to handle large strings and avoid cases where multiple characters map to the same target.

#### Examples:

1. Example 1:
    - Input: `s = "egg"`, `t = "add"`
    - Output: `True`

2. Example 2:
    - Input: `s = "foo"`, `t = "bar"`
    - Output: `False`

3. Example 3:
    - Input: `s = "paper"`, `t = "title"`
    - Output: `True`

Example:
- `is_isomorphic_advanced('abc', 'abc') == True`

Implement `is_isomorphic_advanced(s: str, t: str) -> bool`.
