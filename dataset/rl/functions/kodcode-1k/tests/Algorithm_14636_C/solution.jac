def transpose_matrix(matrix: list[list[int]]) -> list[list[int]] {
    if not matrix {
        return [];
    }
    rows = len(matrix);
    cols = len(matrix[0]);
    transpose = [([0] * rows) for _ in range(cols)];
    for i in range(rows) {
        for j in range(cols) {
            transpose[j][i] = matrix[i][j];
        }
    }
    return transpose;
}

