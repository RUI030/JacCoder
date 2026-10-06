"""
    Sorts the array in a wave-like order where arr[0] >= arr[1] <= arr[2] >= arr[3] ..
    For example: Given arr = [3, 6, 5, 10, 7, 20], the function returns [6, 3, 10, 5, 20, 7]

    :param arr: List[int] input array
    :return: List[int] array sorted in wave order
    """
def sort_in_wave(arr: list[int]) -> list[int] {
    n = len(arr);
    for i in range(0, n, 2) {
        if ((i > 0) and (arr[i] < arr[(i - 1)])) {
            (arr[i], arr[(i - 1)]) = (arr[(i - 1)], arr[i]);
        }
        if ((i < (n - 1)) and (arr[i] < arr[(i + 1)])) {
            (arr[i], arr[(i + 1)]) = (arr[(i + 1)], arr[i]);
        }
    }
    return arr;
}

