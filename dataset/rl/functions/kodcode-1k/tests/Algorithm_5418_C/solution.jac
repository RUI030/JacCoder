"""
    Rotates a given NxN matrix 90 degrees clockwise.
    """
def rotate_matrix(matrix: list[list[int]]) -> list[list[int]] {
    n = len(matrix);
    rotated_matrix = [([0] * n) for _ in range(n)];
    for i in range(n) {
        for j in range(n) {
            rotated_matrix[j][(n - i - 1)] = matrix[i][j];
        }
    }
    return rotated_matrix;
}

