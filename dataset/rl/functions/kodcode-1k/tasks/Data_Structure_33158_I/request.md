# is_valid

Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:
1. Open brackets are closed by the same type of brackets.
2. Open brackets are closed in the correct order.

Write a function `is_valid(s: str) -> bool` that takes a string `s` as input and returns `True` if the string is valid, otherwise returns `False`.

#### Example:

1. Input: `s = "()"`, Output: `True`
2. Input: `s = "()[]{}"`, Output: `True`
3. Input: `s = "(]"`, Output: `False`
4. Input: `s = "([)]"`, Output: `False`
5. Input: `s = "{[]}"`, Output: `True`

#### Constraints:
- The input string `s` can be empty.
- The input string `s` only contains the characters '(', ')', '{', '}', '[' and ']', without any other characters.
- Length of `s` will be at most \(10^4\).

Example:
- `is_valid('()') == True`

Implement `is_valid(s: str) -> bool`.
