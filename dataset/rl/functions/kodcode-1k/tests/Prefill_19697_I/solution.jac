"""
    Returns a list of tuples, each representing the possible integer dimensions (length, width)
    that a rectangle could have given the area.
    """
def rectangle_dimensions(area: int) -> list[tuple[int, int]] {
    dimensions = [];
    for length in range(1, (int((area ** 0.5)) + 1)) {
        if ((area % length) == 0) {
            width = area // length;
            dimensions.append((length, width));
        }
    }
    return dimensions;
}

