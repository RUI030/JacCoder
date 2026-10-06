"""
    Checks if a given sequence of parentheses is balanced.

    Parameters:
    s (str): The input string containing only '(' and ')'

    Returns:
    str: "YES" if the sequence is balanced, otherwise "NO"
    """
def is_balanced_parentheses(s: str) -> str {
    stack = [];
    for char in s {
        if (char == '(') {
            stack.append(char);
        } elif (char == ')') {
            if not stack {
                return "NO";
            }
            stack.pop();
        }
    }
    return "YES" if not stack else "NO";
}

