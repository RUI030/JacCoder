"""
    Return the maximum sum of non-adjacent elements in the given array.
    """
def max_sum_non_adjacent(nums: list[int]) -> int {
    if not nums {
        return 0;
    }
    incl = 0;
    excl = 0;
    for num in nums {
        new_excl = max(incl, excl);
        incl = excl + num;
        excl = new_excl;
    }
    return max(incl, excl);
}

