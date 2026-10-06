"""
    Returns the index of the first occurrence of query in array.
    If query is not found, returns -1.
    """
def first_occurrence(array: list[int], query: int) -> int {
    (left, right) = (0, (len(array) - 1));
    result = -1;
    while (left <= right) {
        mid = left + ((right - left) // 2);
        if (array[mid] == query) {
            result = mid;
            right = mid - 1;
        } elif (array[mid] < query) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return result;
}

