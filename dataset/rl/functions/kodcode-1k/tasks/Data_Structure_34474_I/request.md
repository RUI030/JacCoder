# is_isomorphic

**Scenario**: You are developing a software solution that validates encoded messages against their original messages by ensuring the encoding maintains a consistent character mapping. One key part of this validation is to check if two given strings are isomorphic.

### Problem Statement
Implement the function `is_isomorphic(s: str, t: str) -> bool` to determine if two strings `s` and `t` are isomorphic.

Two strings are isomorphic if the characters in `s` can be replaced to get `t`. All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

### Input
* `s` (string): A string of length `n` (1 <= n <= 10^4).
* `t` (string): A string of length `n`.

### Output
* Return `True` if the two strings are isomorphic; otherwise, return `False`.

### Constraints
1. Length of `s` and `t` are equal.
2. Both strings consist of any possible characters including digits, letters, and special characters.
3. Minimum length of strings: 1

### Examples
1. Input: `s = "egg"`, `t = "add"`  
   Output: `True`
2. Input: `s = "foo"`, `t = "bar"`  
   Output: `False`
3. Input: `s = "paper"`, `t = "title"`  
   Output: `True`

### Additional Requirements
1. The time complexity should be O(n), where n is the length of the string.
2. The space complexity should be O(n).

*Note*: The function implementation should handle edge cases such as different lengths, empty strings, and repeated characters correctly.

Example:
- `is_isomorphic('egg', 'add') == True`

Implement `is_isomorphic(s: str, t: str) -> bool`.
