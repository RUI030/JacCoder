"""
    Given a list of integers, this function returns the minimum number of operations
    required to make all elements of the list equal. One operation consists of either
    adding or subtracting 1 from any element in the list.
    """
def min_operations_to_equalize(lst: list[int]) -> int {
    if not lst {
        return 0;
    }
    lst_sorted = sorted(lst);
    n = len(lst);
    median = lst_sorted[(n // 2)] if ((n % 2) != 0) else lst_sorted[((n // 2) - 1)];
    operations = sum(abs((x - median)) for x in lst);
    return operations;
}

