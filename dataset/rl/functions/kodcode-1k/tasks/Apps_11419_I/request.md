# balance_parentheses

Write a function `balance_parentheses(s)` that takes a string containing a mixture of parentheses `(` and `)` and returns a balanced version of the string by adding the minimum number of parentheses at any position. A balanced string is where every opening parenthesis has a corresponding closing parenthesis and vice versa.

Example 1: `balance_parentheses("(()") -> "(())"`
Example 2: `balance_parentheses("())(") -> "(())()"`
Example 3: `balance_parentheses(")(") -> "()"`

The function should ensure that the order of the input characters is maintained and should not remove any existing characters in the input string.

Example:
- `balance_parentheses('(()') == '(())'`

Implement `balance_parentheses(s: str) -> str`.
