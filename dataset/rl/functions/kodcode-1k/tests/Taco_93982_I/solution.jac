"""
    Merges two sorted arrays into a single sorted array.

    Parameters:
    arr1 (list): The first sorted array.
    arr2 (list): The second sorted array.

    Returns:
    list: A merged and sorted array.
    """
def merge_arrays(arr1: list[int], arr2: list[int]) -> list[int] {
    merged_array = [];
    (i, j) = (0, 0);
    while ((i < len(arr1)) and (j < len(arr2))) {
        if (arr1[i] <= arr2[j]) {
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

