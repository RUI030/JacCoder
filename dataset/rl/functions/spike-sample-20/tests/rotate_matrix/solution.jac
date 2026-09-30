def rotate_matrix(m: list[list[int]]) -> list[list[int]] {
    if not m {
        return [];
    }
    rows = len(m);
    return [[m[rows - 1 - r][c] for r in range(rows)] for c in range(len(m[0]))];
}
