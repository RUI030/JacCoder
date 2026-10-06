"""
    Returns the length of the longest balanced substring consisting of '(' and ')'.
    """
def longest_balanced_substring(s: str) -> int {
    max_len = 0;
    stack = [-1];
    for (i, char) in enumerate(s) {
        if (char == '(') {
            stack.append(i);
        } else {
            stack.pop();
            if stack {
                max_len = max(max_len, (i - stack[-1]));
            } else {
                stack.append(i);
            }
        }
    }
    return max_len;
}

