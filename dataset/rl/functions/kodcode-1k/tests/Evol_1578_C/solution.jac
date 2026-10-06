"""
    Determines if a string contains balanced parentheses.

    Args:
    s (str): The input string.

    Returns:
    bool: True if the parentheses are balanced, False otherwise.
    """
def is_balanced(s: str) -> bool {
    stack = [];
    for char in s {
        if (char == '(') {
            stack.append(char);
        } elif (char == ')') {
            if not stack {
                return False;
            }
            stack.pop();
        }
    }
    return not stack;
}

