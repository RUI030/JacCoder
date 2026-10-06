"""
    Removes exactly k digits from the list nums to form the largest possible number.
    Returns the resulting number as a string with leading zeros stripped.
    If the result is an empty string, returns "0".
    """
def remove_k_digits(nums: list[int], k: int) -> str {
    stack = [];
    for num in nums {
        while ((k > 0) and stack and (stack[-1] < num)) {
            stack.pop();
            k -= 1;
        }
        stack.append(num);
    }
    while (k > 0) {
        stack.pop();
        k -= 1;
    }
    result = ''.join(map(str, stack)).lstrip('0');
    return result if result else "0";
}

