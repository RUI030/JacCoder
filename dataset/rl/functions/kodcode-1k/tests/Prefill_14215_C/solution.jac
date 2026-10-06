"""
    Returns the list that contains the most elements that sum up to the target value.
    If both lists have the same number of elements that sum up to the target, return the first list.
    If neither list meets the criteria, return an empty list.
    """
def find_list_with_most_elements_sum_to_target(list1: list[int], list2: list[int], target: int) -> list[int] {
    count1 = sum(
        1
        for x in list1
        if (x == target)
    );
    count2 = sum(
        1
        for x in list2
        if (x == target)
    );
    if (count1 > count2) {
        return list1;
    } elif (count2 > count1) {
        return list2;
    } else {
        return list1 if (count1 > 0) else [];
    }
}

