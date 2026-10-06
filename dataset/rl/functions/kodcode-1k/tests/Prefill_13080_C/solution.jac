"""
    This function takes a list of non-negative integers and returns
    the sum of the digits of the largest number in the list.
    """
def sum_of_digits_of_largest_number(numbers: list[int]) -> int {
    if not numbers {
        return 0;
    }
    largest_number = max(numbers);
    return sum(int(digit) for digit in str(largest_number));
}

