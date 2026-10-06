"""
    Check if the stack is sorted in descending order from bottom to top.
    """
def is_sorted_descending(stack: list[int]) -> bool {
    n = len(stack);
    if (n < 2) {
        return True;
    }
    for i in range((n - 1)) {
        if (stack[i] < stack[(i + 1)]) {
            return False;
        }
    }
    return True;
}

