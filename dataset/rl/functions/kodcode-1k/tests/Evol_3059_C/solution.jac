import from typing { List, Union }
"""
    Evaluates a list of arithmetic expressions.
    Parameters:
    - expressions (List[str]): A list of strings where each string is an arithmetic expression.

    Returns:
    - List[Union[float, str]]: List of evaluation results or "ERROR" for invalid expressions.
    """
def evaluate_expressions(expressions: list[str]) -> list[float | str] {
    results = [];
    for expr in expressions {
        try {
            if ('+' in expr) {
                parts = expr.split('+');
                op = '+';
            } elif ('-' in expr) {
                parts = expr.split('-');
                op = '-';
            } elif ('*' in expr) {
                parts = expr.split('*');
                op = '*';
            } elif ('/' in expr) {
                parts = expr.split('/');
                op = '/';
            } else {
                results.append("ERROR");
                continue;
            }
            if (len(parts) != 2) {
                results.append("ERROR");
                continue;
            }
            part1 = parts[0].strip();
            part2 = parts[1].strip();
            num1 = int(part1);
            num2 = int(part2);
            if (op == '+') {
                results.append((num1 + num2));
            } elif (op == '-') {
                results.append((num1 - num2));
            } elif (op == '*') {
                results.append((num1 * num2));
            } elif (op == '/') {
                if (num2 == 0) {
                    results.append("ERROR");
                } else {
                    results.append((num1 / num2));
                }
            }
        } except Exception as e {
            results.append("ERROR");
        }
    }
    return results;
}

