"""
    Returns the largest possible even number that can be formed from the given set of digits.
    If it is not possible to form an even number, returns -1.

    Parameters:
    n (int): Number of elements in the set.
    elements (list): List of integers representing the digits.

    Returns:
    int: Largest possible even number or -1.
    """
def largest_even_number(n: int, elements: list[int]) -> int {
    even_digits = [
        x
        for x in elements
        if ((x % 2) == 0)
    ];
    odd_digits = [
        x
        for x in elements
        if ((x % 2) != 0)
    ];
    if not even_digits {
        return -1;
    }
    elements_sorted = sorted(elements, reverse=True);
    smallest_even_digit = min(
        [
            x
            for x in elements_sorted
            if ((x % 2) == 0)
        ]
    );
    elements_sorted.remove(smallest_even_digit);
    elements_sorted.append(smallest_even_digit);
    largest_even_num = int(''.join(map(str, elements_sorted)));
    return largest_even_num;
}

