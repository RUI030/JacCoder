"""
    This function calculates the total amount of rainwater that can be trapped between buildings.

    Parameters:
        heights (list[int]): The list of heights of the buildings.

    Returns:
        int: The total amount of trapped rainwater.
    """
def calculate_trapped_rainwater(heights: list[int]) -> int {
    if not heights {
        return 0;
    }
    n = len(heights);
    left_max = [0] * n;
    right_max = [0] * n;
    left_max[0] = heights[0];
    for i in range(1, n) {
        left_max[i] = max(left_max[(i - 1)], heights[i]);
    }
    right_max[(n - 1)] = heights[(n - 1)];
    for i in range((n - 2), -1, -1) {
        right_max[i] = max(right_max[(i + 1)], heights[i]);
    }
    total_water = 0;
    for i in range(n) {
        total_water += min(left_max[i], right_max[i]) - heights[i];
    }
    return total_water;
}

