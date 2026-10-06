"""
    Filters even numbers from the input list and returns the list of even numbers.
    Also prints the number of even numbers filtered out.

    :param numbers: List of integers.
    :return: List of filtered even numbers.
    """
def filter_even_numbers(numbers: list[int]) -> list[int] {
    even_numbers = [
        num
        for num in numbers
        if ((num % 2) == 0)
    ];
    print(len(even_numbers));
    return even_numbers;
}

