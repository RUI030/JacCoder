"""
    Determines if the elements in a given stack are in ascending order from bottom to top.
    :param stack: List representing a stack; element at the end is the top of the stack.
    :return: True if elements are sorted in ascending order from bottom to top, False otherwise.
    """
def is_sorted_stack(stack: list[int]) -> bool {
    if not stack {
        return True;
    }
    temp_stack = stack[:];
    prev = temp_stack.pop();
    while temp_stack {
        curr = temp_stack.pop();
        if (curr > prev) {
            return False;
        }
        prev = curr;
    }
    return True;
}

