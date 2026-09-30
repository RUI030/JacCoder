def pascal_row(n: int) -> list[int] {
    row: list[int] = [1];
    for _ in range(n) {
        row = [1] + [row[i] + row[i + 1] for i in range(len(row) - 1)] + [1];
    }
    return row;
}
