"""
    Merges two sorted arrays into a single sorted array in O(n) time complexity.

    :param arr1: List[int], a sorted array
    :param arr2: List[int], a sorted array
    :return: List[int], a merged sorted array
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

