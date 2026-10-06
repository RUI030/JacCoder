"""
    Returns the index of the maximum value in a list of numbers.
    If the list is empty, returns -1.
    """
def find_max_index(numbers: list[int]) -> int {
    if not numbers {
        return -1;
    }
    max_index = 0;
    for i in range(1, len(numbers)) {
        if (numbers[i] > numbers[max_index]) {
            max_index = i;
        }
    }
    return max_index;
}

