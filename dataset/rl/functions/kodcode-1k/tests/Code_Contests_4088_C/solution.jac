import from typing { List }
"""
    Finds the single element that appears exactly once in the array where
    every other element appears twice.
    This implementation uses bitwise XOR to achieve linear runtime complexity.
    """
def find_single_element(arr: list[int]) -> int {
    single_element = 0;
    for num in arr {
        single_element ^= num;
    }
    return single_element;
}

