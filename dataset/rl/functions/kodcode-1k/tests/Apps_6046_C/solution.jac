import from math { gcd, floor }
"""
    Determines the side length of the largest possible square plot and the total number
    of such square plots that can fit in the rectangular plot with length L and width W.

    Args:
    L (float): The length of the rectangular plot.
    W (float): The width of the rectangular plot.

    Returns:
    tuple: A tuple containing the side length of the largest square plot (in meters)
           and the total number of such square plots.
    """
def garden_plots(L: float, W: float) -> tuple[int, int] {
    if ((L == 0) or (W == 0)) {
        return (0, 0);
    }
    L = floor(L);
    W = floor(W);
    side_length = gcd(L, W);
    num_plots = (L * W) // (side_length ** 2);
    return (side_length, num_plots);
}

