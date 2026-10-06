"""
    Given a list of non-negative integers representing the heights of the bars,
    compute how much water it can trap after raining.
    """
def trap_water(heights: list[int]) -> int {
    if not heights {
        return 0;
    }
    n = len(heights);
    (left, right) = (0, (n - 1));
    (left_max, right_max) = (heights[left], heights[right]);
    trapped_water = 0;
    while (left < right) {
        if (heights[left] < heights[right]) {
            left += 1;
            left_max = max(left_max, heights[left]);
            trapped_water += left_max - heights[left];
        } else {
            right -= 1;
            right_max = max(right_max, heights[right]);
            trapped_water += right_max - heights[right];
        }
    }
    return trapped_water;
}

