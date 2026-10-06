def longest_beautiful_view(heights: list[int]) -> int {
    n = len(heights);
    if (n < 3) {
        return 0;
    }
    max_length = 0;
    i = 1;
    while (i < n) {
        while ((i < n) and (heights[i] == heights[(i - 1)])) {
            i += 1;
        }
        increasing = 0;
        while ((i < n) and (heights[i] > heights[(i - 1)])) {
            increasing += 1;
            i += 1;
        }
        decreasing = 0;
        while ((i < n) and (heights[i] < heights[(i - 1)])) {
            decreasing += 1;
            i += 1;
        }
        if ((increasing > 0) and (decreasing > 0)) {
            max_length = max(max_length, (increasing + decreasing + 1));
        }
    }
    return max_length;
}

