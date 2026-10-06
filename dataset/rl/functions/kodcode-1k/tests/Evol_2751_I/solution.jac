import from typing { List }
"""
    Returns the maximum product of any three distinct numbers from the list.
    """
def max_product_of_three(nums: list[int]) -> int {
    nums.sort();
    return max((nums[-1] * nums[-2] * nums[-3]), (nums[0] * nums[1] * nums[-1]));
}

