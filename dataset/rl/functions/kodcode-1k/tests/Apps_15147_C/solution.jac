"""
    This function takes a list of integers and returns the minimum number of operations needed to make all elements in the list the same.
    """
def min_operations_to_make_equal(nums: list[int]) -> int {
    import from math { gcd }
    import from functools { reduce }
    array_gcd = reduce(gcd, nums);
    n = len(nums);
    return (n * 2);
}

