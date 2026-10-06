"""
    Given a string representing a mathematical expression, evaluate and return the result as an integer.

    Parameters:
    expression (str): The mathematical expression containing non-negative integers and '+' or '-' operators

    Returns:
    int: The result of evaluating the expression
    """
def evaluate_expression(expression: str) -> int {
    result = 0;
    current_number = 0;
    operation = '+';
    for char in expression {
        if char.isdigit() {
            current_number = (current_number * 10) + int(char);
        } else {
            if (operation == '+') {
                result += current_number;
            } else {
                result -= current_number;
            }
            operation = char;
            current_number = 0;
        }
    }
    if (operation == '+') {
        result += current_number;
    } else {
        result -= current_number;
    }
    return result;
}

