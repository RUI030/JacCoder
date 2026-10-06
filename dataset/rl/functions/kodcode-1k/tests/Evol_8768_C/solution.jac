"""
    Returns a new list where each element is the product of the corresponding
    elements from the input lists. If one list is shorter than the other, append
    the remaining elements of the longer list as they are to the end of the output list.
    """
def multiply_lists(list1: list[int], list2: list[int]) -> list[int] {
    result = [];
    min_length = min(len(list1), len(list2));
    for i in range(min_length) {
        result.append((list1[i] * list2[i]));
    }
    if (len(list1) > min_length) {
        result.extend(list1[min_length:]);
    } elif (len(list2) > min_length) {
        result.extend(list2[min_length:]);
    }
    return result;
}

