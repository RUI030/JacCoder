"""
    Find the maximum possible perimeter of a triangular section
    that can be formed using exactly three of the given pipes.
    """
def max_triangle_perimeter(pipes: list[int]) -> int {
    pipes.sort(reverse=True);
    n = len(pipes);
    for i in range((n - 2)) {
        (a, b, c) = (pipes[i], pipes[(i + 1)], pipes[(i + 2)]);
        if (a < (b + c)) {
            return (a + b + c);
        }
    }
    return 0;
}

