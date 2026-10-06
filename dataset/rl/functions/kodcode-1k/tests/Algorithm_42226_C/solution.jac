import from typing { List }
"""
    Calculate the total amount of water trapped between buildings, represented by height array.
    """
def calculate_trapped_water(heights: list[int]) -> int {
    if (not heights or (len(heights) < 3)) {
        return 0;
    }
    total_water = 0;
    (left, right) = (0, (len(heights) - 1));
    (left_max, right_max) = (heights[left], heights[right]);
    while (left < right) {
        if (heights[left] < heights[right]) {
            left += 1;
            left_max = max(left_max, heights[left]);
            total_water += max(0, (left_max - heights[left]));
        } else {
            right -= 1;
            right_max = max(right_max, heights[right]);
            total_water += max(0, (right_max - heights[right]));
        }
    }
    return total_water;
}

