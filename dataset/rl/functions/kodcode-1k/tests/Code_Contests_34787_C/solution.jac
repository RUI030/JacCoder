"""
    Returns the maximum height difference between two successive elements in the array.
    """
def maxHeightDifference(heights: list[int]) -> int {
    max_diff = 0;
    for i in range(1, len(heights)) {
        diff = abs((heights[i] - heights[(i - 1)]));
        if (diff > max_diff) {
            max_diff = diff;
        }
    }
    return max_diff;
}

