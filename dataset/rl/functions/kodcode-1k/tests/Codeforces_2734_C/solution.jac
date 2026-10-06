"""
    Returns the length of the longest continuous segment that can be planted in increasing order.

    Parameters:
    n (int): the number of plants
    heights (List[int]): a list of plant heights

    Returns:
    int: length of the longest increasing segment
    """
def longest_increasing_segment(n: int, heights: list[int]) -> int {
    if (n == 0) {
        return 0;
    }
    max_length = 1;
    current_length = 1;
    for i in range(1, n) {
        if (heights[i] > heights[(i - 1)]) {
            current_length += 1;
            max_length = max(max_length, current_length);
        } else {
            current_length = 1;
        }
    }
    return max_length;
}

