# evaluate_expression

Implement a function that accepts a string representing a mathematical expression containing non-negative integers and '+' or '-' operators. The function should evaluate the expression and return the result as an integer. The input string does not contain any spaces, and is guaranteed to represent a valid expression.

def evaluate_expression(expression):
    """
    Given a string representing a mathematical expression, evaluate and return the result as an integer.

    Examples:
    >>> evaluate_expression("3+5-2") == 6
    >>> evaluate_expression("10+20-30") == 0
    >>> evaluate_expression("40-15+5") == 30
    """

Example:
- `evaluate_expression('3+5-2') == 6`

Implement `evaluate_expression(expression: str) -> int`.
