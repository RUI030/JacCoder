"""
    Returns the element that appears only once in the array.
    The array is guaranteed to have all elements appearing exactly twice except for one element.

    Time Complexity: O(n)
    Space Complexity: O(1)
    """
def find_single_element(arr: list[int]) -> int {
    unique_element = 0;
    for num in arr {
        unique_element ^= num;
    }
    return unique_element;
}

