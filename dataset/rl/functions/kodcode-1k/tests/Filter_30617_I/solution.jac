"""
    Deletes all occurrences of `element` from `arr` while maintaining the order
    of other elements. This function runs in O(n) time and uses O(1) space.
    """
def delete_all_occurrences(arr: list[int], element: int) -> list[int] {
    new_index = 0;
    for i in range(len(arr)) {
        if (arr[i] != element) {
            arr[new_index] = arr[i];
            new_index += 1;
        }
    }
    for i in range(new_index, len(arr)) {
        arr.pop();
    }
    return arr;
}

