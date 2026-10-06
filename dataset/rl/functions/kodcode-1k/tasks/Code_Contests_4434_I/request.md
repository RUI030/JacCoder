# is_balanced_parentheses

You are tasked with implementing a function that checks whether a given sequence of parentheses is balanced. A sequence of parentheses is balanced if every opening parenthesis '(' has a corresponding closing parenthesis ')' and the pairs are properly nested.

Input

The input consists of a single string s (1 ≤ |s| ≤ 105), which contains only characters '(' and ')'.

Output

The output should be a single line containing "YES" if the sequence is balanced, and "NO" otherwise.

Examples

Input

(())
Output

YES

Input

(()))
Output

NO

Input

)(()
Output

NO

Note

In the first example, the sequence is balanced because every opening parenthesis has a corresponding closing parenthesis and they are properly nested.

In the second example, the sequence is not balanced because there is an extra closing parenthesis.

In the third example, the sequence is not balanced because it starts with a closing parenthesis, so proper nesting is violated.

Example:
- `is_balanced_parentheses('(())') == 'YES'`

Implement `is_balanced_parentheses(s: str) -> str`.
