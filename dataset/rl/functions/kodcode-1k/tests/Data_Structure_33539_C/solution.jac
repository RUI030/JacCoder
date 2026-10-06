import from typing { List }
"""
    Enhanced interpolation search to handle edge cases and optimize performance.
    """
def optimized_interpolation_search(array: list[int], search_key: int) -> int {
    if not array {
        return -1;
    }
    (low, high) = (0, (len(array) - 1));
    while ((low <= high) and (array[low] <= search_key <= array[high])) {
        if (array[low] == array[high]) {
            if (array[low] == search_key) {
                return low;
            } else {
                return -1;
            }
        }
        pos = (
            low
            + (((high - low) // (array[high] - array[low])) * (search_key - array[low]))
        );
        if ((pos < 0) or (pos >= len(array))) {
            return -1;
        }
        if (array[pos] == search_key) {
            return pos;
        }
        if (array[pos] < search_key) {
            low = pos + 1;
        } else {
            high = pos - 1;
        }
    }
    return -1;
}

