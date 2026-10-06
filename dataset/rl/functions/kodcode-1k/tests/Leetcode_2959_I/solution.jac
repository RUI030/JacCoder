"""
    Returns the list of indices of buildings that can see the sunset.
    A building can see the sunset if it is taller than all the buildings to its right.

    :param heights: List of building heights
    :return: List of indices of buildings that can see the sunset
    """
def sunset_views(heights: list[int]) -> list[int] {
    if not heights {
        return [];
    }
    sunset_buildings = [];
    max_height_from_right = float('-inf');
    for i in range((len(heights) - 1), -1, -1) {
        if (heights[i] > max_height_from_right) {
            sunset_buildings.append(i);
            max_height_from_right = heights[i];
        }
    }
    return `list(reversed(sunset_buildings));
}

