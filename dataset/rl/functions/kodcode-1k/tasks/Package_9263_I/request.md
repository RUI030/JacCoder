# longest_valid_parentheses

Implement a function `longest_valid_parentheses(s: str) -> int` that takes a string consisting of only the characters '(' and ')' and returns the length of the longest valid (well-formed) parentheses substring.

A well-formed parentheses substring is defined in the following way:
1. An empty string is valid.
2. If `A` is a valid string, then `(A)` is also a valid string.
3. If `A` and `B` are valid strings, then `AB` is also valid.

For example, the input string `s = "(()("` has two well-formed substrings: `"()"` and the nested `"()"` within `"(()("`, and the maximum length is 2. Another example, `s = ")()())"` should return 4, as the longest well-formed parentheses substring is `()()`. 

The function should efficiently handle large input strings by making a single pass through the string to determine the longest valid parentheses substring. Consider using a stack data structure or two-pointer technique to achieve this.

Provide the implementation of the function `longest_valid_parentheses` based on the given specifications.

Example:
- `longest_valid_parentheses('(((((') == 0`

Implement `longest_valid_parentheses(s: str) -> int`.
