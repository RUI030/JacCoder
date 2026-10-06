"""
    Generates Pascal's Triangle up to the nth row.

    Args:
    n (int): The number of rows in Pascal's Triangle to generate

    Returns:
    list of lists: Pascal's Triangle up to the nth row
    """
def generate_pascals_triangle(n: int) -> list[list[int]] {
    if (n <= 0) {
        return [];
    }
    triangle = [[1]];
    for row in range(1, n) {
        row_list = [1];
        for col in range(1, row) {
            row_list.append(
                (triangle[(row - 1)][(col - 1)] + triangle[(row - 1)][col])
            );
        }
        row_list.append(1);
        triangle.append(row_list);
    }
    return triangle;
}

