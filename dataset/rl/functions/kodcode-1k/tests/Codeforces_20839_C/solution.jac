"""
    Returns the maximum possible difference in heights after removing at most one person.
    """
def max_difference_with_removal(heights: list[int]) -> int {
    n = len(heights);
    if (n <= 2) {
        return 0;
    }
    sorted_heights = sorted(heights);
    max_diff_remove_min = sorted_heights[-1] - sorted_heights[1];
    max_diff_remove_max = sorted_heights[-2] - sorted_heights[0];
    max_diff_no_removal = sorted_heights[-1] - sorted_heights[0];
    return max(max_diff_remove_min, max_diff_remove_max, max_diff_no_removal);
}

