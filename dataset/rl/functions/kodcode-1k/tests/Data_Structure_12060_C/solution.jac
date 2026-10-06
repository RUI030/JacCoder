"""
    Enhanced Selection Sort with Early Termination
    Args:
    - arr: List[int], the list of integers to sort

    Returns:
    - List[int], the sorted list
    """
def enhanced_selection_sort(arr: list[int]) -> list[int] {
    n = len(arr);
    for i in range(n) {
        min_idx = i;
        for j in range((i + 1), n) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }
        (arr[i], arr[min_idx]) = (arr[min_idx], arr[i]);
        already_sorted = True;
        for k in range(1, n) {
            if (arr[(k - 1)] > arr[k]) {
                already_sorted = False;
                break;
            }
        }
        if already_sorted {
            break;
        }
    }
    return arr;
}

