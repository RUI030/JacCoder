"""
    Returns the minimum number of operations required to make all elements of the array equal.
    """
def min_operations_to_make_elements_equal(n: int, arr: list[int]) -> int {
    target = sorted(arr)[(n // 2)];
    return sum(abs((x - target)) for x in arr);
}

