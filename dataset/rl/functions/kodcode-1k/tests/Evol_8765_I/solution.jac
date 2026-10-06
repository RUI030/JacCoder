"""
    Returns a new list consisting of only the even integers
    from the original list, sorted in non-decreasing order.
    """
def even_integers_sorted(lst: list[int]) -> list[int] {
    evens = [
        num
        for num in lst
        if ((num % 2) == 0)
    ];
    n = len(evens);
    for i in range(n) {
        for j in range(0, (n - i - 1)) {
            if (evens[j] > evens[(j + 1)]) {
                (evens[j], evens[(j + 1)]) = (evens[(j + 1)], evens[j]);
            }
        }
    }
    return evens;
}

