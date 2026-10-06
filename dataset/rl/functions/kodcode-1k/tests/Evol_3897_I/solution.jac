"""
    Inserts a given integer into its correct position in a sorted array, maintaining the sorted order.
    """
def insert_in_sorted_array(arr: list[int], num: int) -> list[int] {
    for i in range(len(arr)) {
        if (num <= arr[i]) {
            return (arr[:i] + [num] + arr[i:]);
        }
    }
    return (arr + [num]);
}

