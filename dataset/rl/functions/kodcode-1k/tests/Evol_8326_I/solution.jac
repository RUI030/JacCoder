"""
    Returns a new list containing the squares of the even integers
    and the cubes of the odd integers from the input list.

    Parameters:
    numbers (list): A list of integers.

    Returns:
    list: A new list with processed integers.
    """
def process_numbers(numbers: list[int]) -> list[int] {
    result = [];
    for num in numbers {
        if ((num % 2) == 0) {
            result.append((num ** 2));
        } else {
            result.append((num ** 3));
        }
    }
    return result;
}

