"""
    Remove k digits from the num to get the smallest possible number.
    """
def remove_k_digits(num: str, k: int) -> str {
    stack = [];
    for digit in num {
        while ((k > 0) and stack and (stack[-1] > digit)) {
            stack.pop();
            k -= 1;
        }
        stack.append(digit);
    }
    final_stack = stack[:-k] if k else stack;
    result = ''.join(final_stack).lstrip('0');
    return result if result else '0';
}

