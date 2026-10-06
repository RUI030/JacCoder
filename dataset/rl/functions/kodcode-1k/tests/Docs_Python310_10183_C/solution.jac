import from typing { List }
"""
    Returns a sorted list of squared integers that are positive and even.
    """
def transform_and_filter(nums: list[int]) -> list[int] {
    return sorted(
        [
            (x * x)
            for x in nums
            if ((x > 0) and ((x % 2) == 0))
        ]
    );
}

