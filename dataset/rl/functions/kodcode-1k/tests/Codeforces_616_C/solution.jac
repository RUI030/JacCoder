import from typing { List }
"""
    Returns the amount of water that can be trapped between buildings after it rains.

    :param heights: List of integers representing the height of buildings.
    :return: The total amount of trapped water.
    """
def trapRainWater(heights: list[int]) -> int {
    if (not heights or (len(heights) < 3)) {
        return 0;
    }
    (left, right) = (0, (len(heights) - 1));
    (left_max, right_max) = (heights[left], heights[right]);
    trapped_water = 0;
    while (left < right) {
        if (left_max < right_max) {
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

