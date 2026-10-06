"""
    Determine if the array has any two consecutive integers that follow
    the zigzag pattern of alternating between increasing and decreasing.

    :param arr: List[int] - List of integers
    :return: bool - True if the array contains at least one zigzag pair, False otherwise.
    """
def is_zigzag(arr: list[int]) -> bool {
    if (len(arr) < 2) {
        return False;
    }
    for i in range(1, (len(arr) - 1)) {
        if (
            ((arr[i] > arr[(i - 1)]) and (arr[i] > arr[(i + 1)]))
            or ((arr[i] < arr[(i - 1)]) and (arr[i] < arr[(i + 1)]))
        ) {
            return True;
        }
    }
    return False;
}

