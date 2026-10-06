"""
    Evaluates a mathematical expression containing integers and operators (+, -, *, /).
    Supports parentheses and operator precedence.
    """
def evaluate_expression(expression: str) -> str {
    try {
        result = eval(expression);
    } except ZeroDivisionError {
        return "Error: Division by zero";
    } except Exception {
        return "Error: Invalid expression";
    }
    return result;
}

