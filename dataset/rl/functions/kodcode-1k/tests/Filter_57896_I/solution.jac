"""
    The insertion sort algorithm sorts an array in-place by dividing the array into
    a sorted and an unsorted region. Values from the unsorted region are picked and
    placed at the correct position in the sorted region.

    Steps:
    1. Start from the second element (index 1) as the first element is considered sorted.
    2. Compare the current element with the ones before it and insert it into to its correct place.
    3. Repeat the process for all elements in the array.

    Time Complexity: O(n^2) in worst and average cases.

    Parameters:
    arr (list): The list of numbers to be sorted.

    Returns:
    list: The sorted list.
    """
def insertion_sort(arr: list[int]) -> list[int] {
    for i in range(1, len(arr)) {
        key = arr[i];
        j = i - 1;
        while ((j >= 0) and (key < arr[j])) {
            arr[(j + 1)] = arr[j];
            j -= 1;
        }
        arr[(j + 1)] = key;
    }
    return arr;
}
with entry {
    sorted_array = insertion_sort([5, 2, 9, 1, 5, 6]);
}

