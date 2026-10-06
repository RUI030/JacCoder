"""
    Returns a tuple (duplicate, missing) for the given list of integers
    where one integer appears exactly twice and one integer is missing.
    """
def find_error_nums(nums: list[int]) -> tuple[int, int] {
    n = len(nums);
    sum_of_nums = sum(nums);
    sum_of_squares = sum((x * x) for x in nums);
    expected_sum = (n * (n + 1)) // 2;
    expected_sum_of_squares = (n * (n + 1) * ((2 * n) + 1)) // 6;
    diff1 = sum_of_nums - expected_sum;
    diff2 = (sum_of_squares - expected_sum_of_squares) // diff1;
    duplicate = (diff1 + diff2) // 2;
    missing = duplicate - diff1;
    return (duplicate, missing);
}

