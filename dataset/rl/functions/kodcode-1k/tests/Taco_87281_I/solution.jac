"""
    This function takes a list of photo sizes and a remaining capacity in bytes,
    and returns the maximum number of photos that can be stored without exceeding
    the given capacity.
    """
def max_photos(stored: list[int], capacity: int) -> int {
    stored.sort();
    count = 0;
    used_capacity = 0;
    for photo_size in stored {
        if ((used_capacity + photo_size) <= capacity) {
            used_capacity += photo_size;
            count += 1;
        } else {
            break;
        }
    }
    return count;
}

