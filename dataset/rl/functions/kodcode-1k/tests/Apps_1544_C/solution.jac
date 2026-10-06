"""
    Merges two sorted arrays into a single sorted array.

    Parameters:
        arr1 (list of int): First sorted array.
        arr2 (list of int): Second sorted array.

    Returns:
        list of int: Merged and sorted array.
    """
def merge_sorted_arrays(arr1: list[int], arr2: list[int]) -> list[int] {
    merged = [];
    i = j=0;
    while ((i < len(arr1)) and (j < len(arr2))) {
        if (arr1[i] < arr2[j]) {
            merged.append(arr1[i]);
            i += 1;
        } else {
            merged.append(arr2[j]);
            j += 1;
        }
    }
    while (i < len(arr1)) {
        merged.append(arr1[i]);
        i += 1;
    }
    while (j < len(arr2)) {
        merged.append(arr2[j]);
        j += 1;
    }
    return merged;
}

