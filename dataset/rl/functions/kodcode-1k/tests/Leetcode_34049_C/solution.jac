"""
    Finds the maximum element in a bitonic sequence.

    Bitonic sequence: A sequence that first increases then decreases.

    :param arr: List of integers in bitonic order.
    :return: The maximum element in the bitonic sequence.
    """
def find_max_in_bitonic(arr: list[int]) -> int {
    (left, right) = (0, (len(arr) - 1));
    while (left < right) {
        mid = left + ((right - left) // 2);
        if (arr[mid] > arr[(mid + 1)]) {
            right = mid;
        } else {
            left = mid + 1;
        }
    }
    return arr[left];
}

