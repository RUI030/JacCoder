"""
    Returns a string representing a diamond shape of width 'd'.
    :param d: an odd integer representing the widest part of the diamond.
    :return: A string representing the diamond shape.
    """
def diamond(d: int) -> str {
    if (((d % 2) == 0) or (d <= 0)) {
        return "";
    }
    diamond_shape = [];
    for i in range(d) {
        if (i <= (d // 2)) {
            stars = '*' * ((2 * i) + 1);
        } else {
            stars = '*' * ((2 * (d - i - 1)) + 1);
        }
        spaces = ' ' * ((d - len(stars)) // 2);
        diamond_shape.append((spaces + stars + spaces));
    }
    return '\n'.join(diamond_shape);
}

