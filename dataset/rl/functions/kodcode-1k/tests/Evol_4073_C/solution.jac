"""
    Merges two sorted arrays into a single sorted array.

    Args:
    arr1 (list): First sorted array.
    arr2 (list): Second sorted array.

    Returns:
    list: Merged sorted array.
    """
def mergeSortedLists(arr1: list[int], arr2: list[int]) -> list[int] {
    result = [];
    (i, j) = (0, 0);
    while ((i < len(arr1)) and (j < len(arr2))) {
        if (arr1[i] <= arr2[j]) {
            result.append(arr1[i]);
            i += 1;
        } else {
            result.append(arr2[j]);
            j += 1;
        }
    }
    while (i < len(arr1)) {
        result.append(arr1[i]);
        i += 1;
    }
    while (j < len(arr2)) {
        result.append(arr2[j]);
        j += 1;
    }
    return result;
}

