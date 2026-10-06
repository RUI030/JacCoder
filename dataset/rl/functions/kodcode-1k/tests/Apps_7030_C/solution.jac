"""
    Returns the number of buildings that have an unobstructed view of the sunset.
    """
def unobstructed_view(buildings: list[int]) -> int {
    if not buildings {
        return 0;
    }
    count = 0;
    max_height = 0;
    for height in buildings {
        if (height > max_height) {
            count += 1;
            max_height = height;
        }
    }
    return count;
}

