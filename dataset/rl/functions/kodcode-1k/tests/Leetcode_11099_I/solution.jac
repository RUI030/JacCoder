"""
    Returns the lexicographically smallest sequence of heights possible after k steps.
    """
def smallest_sequence_after_k_steps(heights: list[int], k: int) -> list[int] {
    n = len(heights);
    for i in range(n) {
        if (k == 0) {
            break;
        }
        smallest_idx = i;
        for j in range((i + 1), min(n, (i + k + 1))) {
            if (heights[j] < heights[smallest_idx]) {
                smallest_idx = j;
            }
        }
        if (smallest_idx != i) {
            while (smallest_idx > i) {
                (heights[smallest_idx], heights[(smallest_idx - 1)]) = (
                    heights[(smallest_idx - 1)],
                    heights[smallest_idx]
                );
                smallest_idx -= 1;
                k -= 1;
            }
        }
    }
    return heights;
}

