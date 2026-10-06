"""
    Returns the maximum number of equilateral triangles that can be formed
    from the given sticks lengths.
    """
def max_equilateral_triangles(n: int, lengths: list[int]) -> int {
    import from collections { Counter }
    length_counts = Counter(lengths);
    triangles = 0;
    for count in length_counts.values() {
        triangles += count // 3;
    }
    return triangles;
}

