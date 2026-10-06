import from typing { List }
"""
    Rotates the given NxN matrix 90 degrees clockwise.

    Args:
    - matrix (List[List[int]]): The NxN matrix to rotate.

    Returns:
    - List[List[int]]: The rotated NxN matrix.
    """
def rotate_matrix_90_degrees(matrix: list[list[int]]) -> list[list[int]] {
    n = len(matrix);
    rotated_matrix = [([0] * n) for _ in range(n)];
    for i in range(n) {
        for j in range(n) {
            rotated_matrix[j][(n - 1 - i)] = matrix[i][j];
        }
    }
    return rotated_matrix;
}

