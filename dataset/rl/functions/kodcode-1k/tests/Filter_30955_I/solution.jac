"""
    Prints Floyd's Triangle with n rows.
    """
def floyds_triangle(n: int) -> list[list[int]] {
    count = 1;
    triangle = [];
    for i in range(1, (n + 1)) {
        row = [];
        for j in range(i) {
            row.append(count);
            count += 1;
        }
        triangle.append(row);
    }
    return triangle;
}

