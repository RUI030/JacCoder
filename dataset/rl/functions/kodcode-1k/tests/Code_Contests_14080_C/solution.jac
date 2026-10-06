"""
    Returns the minimum number of operations required to make all elements of the array equal.
    """
def min_operations_to_equal_elements(n: int, array: list[int]) -> int {
    if (len(`set(array)) == 1) {
        return 0;
    }
    return (n - 1);
}

