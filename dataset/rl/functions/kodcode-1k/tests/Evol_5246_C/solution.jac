"""
    Returns a new list where each element is the sum of itself and all previous elements from the original list.
    """
def cumulative_sum(nums: list[int]) -> list[int] {
    result = [];
    current_sum = 0;
    for num in nums {
        current_sum += num;
        result.append(current_sum);
    }
    return result;
}

