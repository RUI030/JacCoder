"""
    An optimized bubble sort that reduces the number of comparisons and
    performs early termination if the array is already sorted.

    Parameters:
    arr (list): List of integers to sort

    Returns:
    list: Sorted list of integers in ascending order
    """
def optimized_bubble_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    for i in range(n) {
        swapped = False;
        for j in range(0, (n - i - 1)) {
            if (arr[j] > arr[(j + 1)]) {
                (arr[j], arr[(j + 1)]) = (arr[(j + 1)], arr[j]);
                swapped = True;
            }
        }
        if not swapped {
            break;
        }
    }
    return arr;
}

