"""
    Returns the number of distinct strings possible after exactly k operations.

    Parameters:
    n : int - the length of the string
    k : int - the number of operations
    s : str - the given string

    Returns:
    int - the number of distinct strings possible after exactly k operations
    """
def distinct_string_after_k_operations(n: int, k: int, s: str) -> int {
    if (k >= n) {
        return len(`set(s));
    }
    substrings = `set();
    for _ in range(k) {
        for i in range(n) {
            new_string1 = s[1:] + s[0];
            new_string2 = s[-1] + s[:-1];
            substrings.add(new_string1);
            substrings.add(new_string2);
            s = new_string1;
        }
    }
    return len(substrings);
}

