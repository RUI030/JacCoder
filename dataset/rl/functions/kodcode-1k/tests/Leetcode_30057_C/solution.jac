"""
    Returns the lexicographically smallest string by removing exactly k characters from the input string 's'.
    """
def removeKchars(s: str, k: int) -> str {
    stack = [];
    for char in s {
        while ((k > 0) and stack and (stack[-1] > char)) {
            stack.pop();
            k -= 1;
        }
        stack.append(char);
    }
    while (k > 0) {
        stack.pop();
        k -= 1;
    }
    return "".join(stack);
}

