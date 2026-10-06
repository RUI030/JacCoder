"""
    This function returns the lexicographically smallest string by deleting exactly
    `num` characters from the given string `s`.
    """
def smallest_lexicographical_string(s: str, num: int) -> str {
    stack = [];
    to_remove = num;
    for char in s {
        while (stack and (char < stack[-1]) and (to_remove > 0)) {
            stack.pop();
            to_remove -= 1;
        }
        stack.append(char);
    }
    final_stack = stack[:-to_remove] if to_remove else stack;
    return ''.join(final_stack);
}

