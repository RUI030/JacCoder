"""
    Return the maximum number of pieces with nuts by making horizontal and vertical cuts.

    n: Number of rows
    m: Number of columns
    grid: 2D list representing the chocolate bar grid (1 for nut, 0 for plain)
    """
def max_nut_pieces(n: int, m: int, grid: list[list[int]]) -> int {
    num_pieces_with_nuts = 0;
    for row in grid {
        num_pieces_with_nuts += sum(row);
    }
    return num_pieces_with_nuts;
}

