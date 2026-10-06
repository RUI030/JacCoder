"""
    Sorts a list in ascending order using the bubble sort algorithm.

    Parameters:
        arr (list): The list to be sorted.

    Returns:
        list: The sorted list.
    """
def bubble_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    for i in range(n) {
        for j in range(0, (n - i - 1)) {
            if (arr[j] > arr[(j + 1)]) {
                (arr[j], arr[(j + 1)]) = (arr[(j + 1)], arr[j]);
            }
        }
    }
    return arr;
}

