"""
    Determines if there exists a subarray with the sum equal to target_sum.

    Parameters:
        n (int): The number of elements in the array.
        array (list of int): The elements of the array.
        target_sum (int): The target sum to find in the subarray.

    Returns:
        str: "YES" if there is a subarray with sum equal to target_sum, otherwise "NO".
    """
def has_subarray_with_sum(n: int, array: list[int], target_sum: int) -> str {
    current_sum = 0;
    prefix_sums = `set();
    prefix_sums.add(0);
    for num in array {
        current_sum += num;
        if ((current_sum - target_sum) in prefix_sums) {
            return "YES";
        }
        prefix_sums.add(current_sum);
    }
    return "NO";
}

