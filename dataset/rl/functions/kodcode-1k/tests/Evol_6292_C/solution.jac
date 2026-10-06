"""
    Returns a list such that each element at index i of the output list is the
    product of all the numbers in the original array except the one at i.

    :param nums: List of integers
    :return: List of integers with the described property
    """
def product_except_self(nums: list[int]) -> list[int] {
    n = len(nums);
    if (n == 0) {
        return [];
    }
    result = [1] * n;
    left_product = 1;
    for i in range(n) {
        result[i] = left_product;
        left_product *= nums[i];
    }
    right_product = 1;
    for i in range((n - 1), -1, -1) {
        result[i] *= right_product;
        right_product *= nums[i];
    }
    return result;
}

