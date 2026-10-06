def max_decreasing_length(N: int, heights: list[int]) -> int {
    if (N == 1) {
        return 1;
    }
    max_length = 1;
    current_length = 1;
    for i in range(1, N) {
        if (heights[i] <= heights[(i - 1)]) {
            current_length += 1;
            max_length = max(max_length, current_length);
        } else {
            current_length = 1;
        }
    }
    return max_length;
}

