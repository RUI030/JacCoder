def longest_contiguous_multiple_subsequence(n: int, footprints: list[int]) -> int {
    if (n == 0) {
        return 0;
    }
    max_length = 1;
    current_length = 1;
    for i in range(1, n) {
        if ((footprints[i] % footprints[(i - 1)]) == 0) {
            current_length += 1;
        } else {
            current_length = 1;
        }
        max_length = max(max_length, current_length);
    }
    return max_length;
}

