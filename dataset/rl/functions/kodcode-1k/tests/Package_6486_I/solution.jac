"""
    Merges two sorted arrays into one sorted array.

    Parameters:
    arr1 (list): A list of integers sorted in ascending order.
    arr2 (list): Another list of integers sorted in ascending order.

    Returns:
    list: A single list containing all the elements from arr1 and arr2, sorted in ascending order.
    """
def merge_sorted_arrays(arr1: list[int], arr2: list[int]) -> list[int] {
    merged_array = [];
    (i, j) = (0, 0);
    while ((i < len(arr1)) and (j < len(arr2))) {
        if (arr1[i] < arr2[j]) {
            merged_array.append(arr1[i]);
            i += 1;
        } else {
            merged_array.append(arr2[j]);
            j += 1;
        }
    }
    while (i < len(arr1)) {
        merged_array.append(arr1[i]);
        i += 1;
    }
    while (j < len(arr2)) {
        merged_array.append(arr2[j]);
        j += 1;
    }
    return merged_array;
}

