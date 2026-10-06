"""
    Returns the maximum possible number of swaps to make the array well-balanced.
    If already well-balanced, returns 0.
    """
def max_swaps_to_balance(nums: list[int]) -> int {
    sum_even = sum(nums[i] for i in range(0, len(nums), 2));
    sum_odd = sum(nums[i] for i in range(1, len(nums), 2));
    if (sum_even == sum_odd) {
        return 0;
    }
    diff = abs((sum_even - sum_odd));
    max_swaps = 0;
    for i in range(0, len(nums), 2) {
        for j in range(1, len(nums), 2) {
            new_sum_even = (sum_even - nums[i]) + nums[j];
            new_sum_odd = (sum_odd - nums[j]) + nums[i];
            if (new_sum_even == new_sum_odd) {
                max_swaps = 1;
                break;
            }
        }
        if (max_swaps == 1) {
            break;
        }
    }
    return max_swaps;
}

