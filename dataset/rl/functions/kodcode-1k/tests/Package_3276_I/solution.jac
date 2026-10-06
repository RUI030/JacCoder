"""
    Returns a list where each element is the product of all the elements of the input list except the one at that position.

    :param nums: List of integers
    :return: List of integers
    """
def product_except_self(nums: list[int]) -> list[int] {
    if not nums {
        return [];
    }
    n = len(nums);
    if (n == 1) {
        return [0];
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

