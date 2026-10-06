"""
    Checks if the brackets in the string s are balanced.
    Supports (), [], and {}.
    """
def is_balanced(s: str) -> bool {
    stack = [];
    bracket_map = {')': '(', ']': '[', '}': '{'};
    open_brackets = `set(bracket_map.values());
    for char in s {
        if (char in open_brackets) {
            stack.append(char);
        } elif (char in bracket_map) {
            if (stack and (stack[-1] == bracket_map[char])) {
                stack.pop();
            } else {
                return False;
            }
        }
    }
    return not stack;
}

