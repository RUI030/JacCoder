"""
    Generate the first numRows of Pascal's triangle.
    """
def generate_pascals_triangle(numRows: int) -> list[list[int]] {
    if (numRows == 0) {
        return [];
    }
    triangle = [[1]];
    for row_number in range(1, numRows) {
        row = [1];
        for j in range(1, row_number) {
            row.append(
                (triangle[(row_number - 1)][(j - 1)] + triangle[(row_number - 1)][j])
            );
        }
        row.append(1);
        triangle.append(row);
    }
    return triangle;
}

