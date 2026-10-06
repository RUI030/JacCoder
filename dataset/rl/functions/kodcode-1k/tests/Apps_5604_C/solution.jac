"""
    Check if the given string is balanced in terms of parentheses.

    Args:
    s (str): The input string containing only parentheses.

    Returns:
    bool: True if the string is balanced, otherwise False.
    """
def findBalancedString(s: str) -> bool {
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
    return (len(stack) == 0);
}

