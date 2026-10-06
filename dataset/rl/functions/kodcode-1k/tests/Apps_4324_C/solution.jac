"""
    Sorts a list of n integers in non-decreasing order using bubble sort algorithm.
    """
def bubble_sort(n: int, arr: list[int]) -> list[int] {
    for i in range(n) {
        for j in range(0, (n - i - 1)) {
            if (arr[j] > arr[(j + 1)]) {
                (arr[j], arr[(j + 1)]) = (arr[(j + 1)], arr[j]);
            }
        }
    }
    return arr;
}

