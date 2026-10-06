def is_valid_expression(expression: str) -> bool {
    stack = [];
    bracket_pairs = {')': '(', '}': '{', ']': '['};
    for char in expression {
        if (char in bracket_pairs.values()) {
            stack.append(char);
        } elif (char in bracket_pairs.keys()) {
            if (stack and (stack[-1] == bracket_pairs[char])) {
                stack.pop();
            } else {
                return False;
            }
        }
    }
    return not stack;
}

