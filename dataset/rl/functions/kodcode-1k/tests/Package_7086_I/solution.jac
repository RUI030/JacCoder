import from typing { List }
"""
    Adjusts the heights of the buildings such that each building is no taller than the one to its left.

    :param heights: List of integers representing the heights of buildings
    :return: List of integers representing the optimized heights of buildings
    """
def optimize_skyline(heights: list[int]) -> list[int] {
    if not heights {
        return [];
    }
    for i in range(1, len(heights)) {
        if (heights[i] > heights[(i - 1)]) {
            heights[i] = heights[(i - 1)];
        }
    }
    return heights;
}

