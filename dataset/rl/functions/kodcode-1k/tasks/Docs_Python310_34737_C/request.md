# validate_expression

Validates an arithmetic expression to ensure it contains only valid characters,
parentheses are balanced, and no consecutive operators are present.

>>> validate_expression("3 + 5")
True
>>> validate_expression("2 * (3 + 4)")
True

Implement `validate_expression(expression: str) -> bool`.
