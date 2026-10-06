"""
    Evaluates a mathematical expression containing integers and the operators + and -,
    handling whitespace within the string, and returns the final result as an integer.
    """
def evaluate_expression(expression: str) -> int {
    total = 0;
    current_number = 0;
    operator = '+';
    for char in (expression + ' ') {
        if char.isdigit() {
            current_number = (current_number * 10) + int(char);
        } elif (char in '+-') {
            if (operator == '+') {
                total += current_number;
            } elif (operator == '-') {
                total -= current_number;
            }
            current_number = 0;
            operator = char;
        }
    }
    if (operator == '+') {
        total += current_number;
    } elif (operator == '-') {
        total -= current_number;
    }
    return total;
}

