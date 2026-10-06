"""
    Returns the maximum amount of water that can be trapped between buildings.
    """
def max_trapped_water(heights: list[int]) -> int {
    n = len(heights);
    if (n < 2) {
        return 0;
    }
    (left, right) = (0, (n - 1));
    max_area = 0;
    while (left < right) {
        height = min(heights[left], heights[right]);
        width = right - left;
        max_area = max(max_area, (height * width));
        if (heights[left] < heights[right]) {
            left += 1;
        } else {
            right -= 1;
        }
    }
    return max_area;
}

