# is_pangram

A pangram is a phrase that contains all the letters of the alphabet at least once. If we want to check if a given string is a pangram, we can simply ensure that each letter 'a' through 'z' appears in the string at least once.

Your task is to write a function `is_pangram(s)` that takes a string `s` and returns `True` if `s` is a pangram and `False` otherwise.

Function Signature: `def is_pangram(s: str) -> bool:`

**Input**
- A single string `s` consisting of lowercase English letters and spaces (1 ≤ |s| ≤ 1000).

**Output**
- A boolean value, `True` if `s` is a pangram and `False` otherwise.

**Example**
1. Input: `"the quick brown fox jumps over a lazy dog"`
   Output: `True`
   Explanation: The given string contains all the letters 'a' through 'z'.
   
2. Input: `"hello world"`
   Output: `False`
   Explanation: The given string does not contain all the letters 'a' through 'z'.

**Note**
- Consider the characters exclusively from 'a' to 'z'. Uppercase letters and any other characters can be ignored.

Example:
- `is_pangram('the quick brown fox jumps over a lazy dog') == True`

Implement `is_pangram(s: str) -> bool`.
