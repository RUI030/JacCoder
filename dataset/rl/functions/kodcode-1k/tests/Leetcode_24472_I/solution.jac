"""
    Check if the input string s is a valid parentheses sequence.

    Args:
    s (str): The input string containing only '(' and ')'

    Returns:
    bool: True if s is a valid parentheses sequence, False otherwise.
    """
def is_valid_parentheses(s: str) -> bool {
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

