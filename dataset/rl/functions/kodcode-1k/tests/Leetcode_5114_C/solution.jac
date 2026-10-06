"""
    Returns the minimum number of operations required to transform s into t.
    If it's impossible to transform s into t, return -1.
    """
def min_operations_to_transform(s: str, t: str) -> int {
    if (len(s) != len(t)) {
        return -1;
    }
    unique_s = `set(s);
    unique_t = `set(t);
    if not unique_t.issubset(unique_s) {
        return -1;
    }
    if (s == t) {
        return 0;
    }
    return 1;
}

