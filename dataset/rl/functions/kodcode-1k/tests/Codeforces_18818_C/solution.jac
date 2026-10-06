"""
    Returns the minimum number of adjacent swaps required to sort the books in ascending order.
    :param n: The number of books on the shelf.
    :param heights: A list of book heights.
    :return: The minimum number of adjacent swaps required to sort the books.
    """
def minimum_swaps_to_sort_books(n: int, heights: list[int]) -> int {
    swaps = 0;
    for i in range(n) {
        for j in range((n - 1)) {
            if (heights[j] > heights[(j + 1)]) {
                (heights[j], heights[(j + 1)]) = (heights[(j + 1)], heights[j]);
                swaps += 1;
            }
        }
    }
    return swaps;
}
with entry {
    n = 5;
    heights = [4, 3, 2, 5, 1];
    print(minimum_swaps_to_sort_books(n, heights));
}

