"""
    Sorts only the odd numbers in the array in ascending order, keeping the even numbers in their original positions.

    Parameters:
    arr (list): a list of integers

    Returns:
    list: a list with odd numbers sorted and even numbers at their original positions
    """
def sort_odd_numbers(arr: list[int]) -> list[int] {
    odd_numbers = sorted(
        [
            x
            for x in arr
            if ((x % 2) != 0)
        ]
    );
    result = [];
    odd_iter = iter(odd_numbers);
    for num in arr {
        if ((num % 2) != 0) {
            result.append(next(odd_iter));
        } else {
            result.append(num);
        }
    }
    return result;
}

