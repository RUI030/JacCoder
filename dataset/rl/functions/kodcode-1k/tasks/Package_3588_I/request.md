# balance_parentheses

Write a function `balance_parentheses(expression)` that accepts a string `expression` containing parentheses: '(', ')', '{', '}', '[' and ']'. The function should determine whether the parentheses in the given expression are balanced. A balanced string of parentheses is defined as every opening parenthesis having a corresponding and properly nested closing parenthesis.

The function should return:
- `True` if the parentheses are balanced,
- `False` otherwise.

For example:
- `balance_parentheses("()")` should return `True`.
- `balance_parentheses("([{}])")` should return `True`.
- `balance_parentheses("({[)])")` should return `False`.
- `balance_parentheses("(()")` should return `False`.

To solve this problem, you can use a stack data structure to keep track of the opening parentheses and ensure they match the corresponding closing parentheses.

Example:
- `balance_parentheses('()') == True`

Implement `balance_parentheses(expression: str) -> bool`.
