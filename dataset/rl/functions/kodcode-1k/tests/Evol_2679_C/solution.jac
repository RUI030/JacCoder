"""
    Merges two sorted lists into a new sorted list.

    Args:
    list1 (list): First sorted list.
    list2 (list): Second sorted list.

    Returns:
    list: New sorted list containing all elements from both input lists.
    """
def merge_sorted_lists(list1: list[int], list2: list[int]) -> list[int] {
    merged_list = [];
    (i, j) = (0, 0);
    while ((i < len(list1)) and (j < len(list2))) {
        if (list1[i] < list2[j]) {
            merged_list.append(list1[i]);
            i += 1;
        } else {
            merged_list.append(list2[j]);
            j += 1;
        }
    }
    while (i < len(list1)) {
        merged_list.append(list1[i]);
        i += 1;
    }
    while (j < len(list2)) {
        merged_list.append(list2[j]);
        j += 1;
    }
    return merged_list;
}

