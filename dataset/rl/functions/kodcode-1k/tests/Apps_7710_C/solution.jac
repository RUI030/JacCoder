"""
    Determine if the string s contains a valid sequence of parentheses.
    """
def isValid(s: str) -> bool {
    stack = [];
    mapping = {')': '(', '}': '{', ']': '['};
    for char in s {
        if (char in mapping) {
            top_element = stack.pop() if stack else '#';
            if (mapping[char] != top_element) {
                return False;
            }
        } else {
            stack.append(char);
        }
    }
    return not stack;
}

