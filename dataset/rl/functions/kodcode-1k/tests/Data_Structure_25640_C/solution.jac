"""
    Check if the stack contains a sequence of consecutive integers starting from the bottom.

    Args:
    stack (List[int]): The input stack represented as a list.

    Returns:
    bool: Returns True if the stack contains consecutive integers starting from the bottom, otherwise False.
    """
def is_consecutive(stack: list[int]) -> bool {
    if (len(stack) < 2) {
        return True;
    }
    prev = stack[0];
    for i in range(1, len(stack)) {
        if (stack[i] != (prev + 1)) {
            return False;
        }
        prev = stack[i];
    }
    return True;
}

