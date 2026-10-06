"""
    Evaluates a string representing an arithmetic expression containing
    addition and subtraction of non-negative integers.

    Parameters:
    expression (str): The arithmetic expression string.

    Returns:
    int: The result of the evaluated expression.
    """
def evaluate_expression(expression: str) -> int {
    i = 0;
    n = len(expression);
    current_number = 0;
    result = 0;
    sign = 1;
    while (i < n) {
        char = expression[i];
        if char.isdigit() {
            current_number = 0;
            while ((i < n) and expression[i].isdigit()) {
                current_number = (current_number * 10) + int(expression[i]);
                i += 1;
            }
            result += sign * current_number;
        } elif (char == '+') {
            sign = 1;
            i += 1;
        } elif (char == '-') {
            sign = -1;
            i += 1;
        }
    }
    return result;
}

