"""
    Simulates shooting all balloons from the top row to the bottom row.

    Args:
    numRows (list of int): A list representing the number of balloons in each row of the grid.

    Returns:
    list of int: The final state of the grid, with each element representing the number of balloons in each row.
    """
def simulate_balloon_falls(numRows: list[int]) -> list[int] {
    n = len(numRows);
    for i in range(1, n) {
        numRows[i] += numRows[(i - 1)];
    }
    return numRows;
}

