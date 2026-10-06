"""
    Merge two sorted lists into a single sorted list.

    Parameters:
    - list1: List[int] representing the first sorted list.
    - list2: List[int] representing the second sorted list.

    Returns:
    - List[int]: A new list containing all elements from list1 and list2 in sorted order.
    """
def merge_sorted_arrays(list1: list[int], list2: list[int]) -> list[int] {
    pointer1 = 0;
    pointer2 = 0;
    merged_list = [];
    while ((pointer1 < len(list1)) and (pointer2 < len(list2))) {
        if (list1[pointer1] <= list2[pointer2]) {
            merged_list.append(list1[pointer1]);
            pointer1 += 1;
        } else {
            merged_list.append(list2[pointer2]);
            pointer2 += 1;
        }
    }
    while (pointer1 < len(list1)) {
        merged_list.append(list1[pointer1]);
        pointer1 += 1;
    }
    while (pointer2 < len(list2)) {
        merged_list.append(list2[pointer2]);
        pointer2 += 1;
    }
    return merged_list;
}

