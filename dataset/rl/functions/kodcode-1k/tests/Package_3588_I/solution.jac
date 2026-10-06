"""
    Determines if the parentheses in the given expression are balanced.
    """
def balance_parentheses(expression: str) -> bool {
    stack = [];
    matching_paren = {')': '(', '}': '{', ']': '['};
    for char in expression {
        if (char in matching_paren.values()) {
            stack.append(char);
        } elif (char in matching_paren) {
            if ((stack == []) or (stack[-1] != matching_paren[char])) {
                return False;
            }
            stack.pop();
        }
    }
    return (stack == []);
}

