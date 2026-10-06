import from typing { List, Tuple, Optional }
"""
    Returns the indices of the two numbers such that they add up to the target.
    If no such pair exists, return None.
    """
def two_sum_with_edge_cases(array: list[int], target: int) -> tuple[int, int] | None {
    if (len(array) < 2) {
        return None;
    }
    num_to_index = {};
    for (i, num) in enumerate(array) {
        complement = target - num;
        if (complement in num_to_index) {
            return (num_to_index[complement], i);
        }
        num_to_index[num] = i;
    }
    return None;
}

