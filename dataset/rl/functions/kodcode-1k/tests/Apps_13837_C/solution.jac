"""
    Returns the sum of the two smallest positive numbers in the given array.
    """
def sum_two_smallest_numbers(arr: list[int]) -> int {
    sorted_arr = sorted(arr);
    return (sorted_arr[0] + sorted_arr[1]);
}

