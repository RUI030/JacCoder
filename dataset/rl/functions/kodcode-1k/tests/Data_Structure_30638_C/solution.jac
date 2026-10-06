"""
    Returns True if the number is strobogrammatic, otherwise False.
    A strobogrammatic number appears the same when rotated 180 degrees.

    :param num: str
    :return: bool
    """
def is_strobogrammatic(num: str) -> bool {
    strobogrammatic_map = {'0': '0', '1': '1', '8': '8', '6': '9', '9': '6'};
    (left, right) = (0, (len(num) - 1));
    while (left <= right) {
        if (
            (num[left] not in strobogrammatic_map)
            or (strobogrammatic_map[num[left]] != num[right])
        ) {
            return False;
        }
        left += 1;
        right -= 1;
    }
    return True;
}

