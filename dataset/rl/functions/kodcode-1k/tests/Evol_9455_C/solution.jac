"""
    This function takes in a list of integers `nums` and returns the sum of the absolute
    values of the unique pairs of integers that add up to zero.

    :param nums: List[int] - a list of integers.
    :return: int - the sum of the absolute values of the unique pairs adding to zero.
    """
def sum_of_unique_abs_pairs(nums: list[int]) -> int {
    num_set = `set(nums);
    result = 0;
    for num in num_set {
        if ((-num in num_set) and (num > 0)) {
            result += abs(num);
        }
    }
    return (result * 2);
}

