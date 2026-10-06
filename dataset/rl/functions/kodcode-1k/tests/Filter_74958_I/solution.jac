"""
    Finds the index of the nearest occurrence of the specified element in the list,
    starting the search from the start_idx. If the element is not found, returns -1.

    :param lst: List of elements to search within
    :param element: Element to find the nearest occurrence of
    :param start_idx: Starting index for the search
    :return: Index of the nearest occurrence of the element, or -1 if not found
    """
def find_nearest_occurrence(lst: list[int], element: int, start_idx: int) -> int {
    n = len(lst);
    min_distance = float('inf');
    result_idx = -1;
    for idx in range(n) {
        if (lst[idx] == element) {
            distance = abs((idx - start_idx));
            if (distance < min_distance) {
                min_distance = distance;
                result_idx = idx;
            }
        }
    }
    return result_idx;
}

