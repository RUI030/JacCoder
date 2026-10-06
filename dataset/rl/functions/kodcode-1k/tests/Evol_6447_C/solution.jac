"""
    Returns a new list where each integer is replaced with the product of all other
    integers in the original list, excluding the integer at that position.

    Args:
    nums (list): List of integers.

    Returns:
    list: List of integers after transformation.
    """
def product_excluding_self(nums: list[int]) -> list[int] {
    if not nums {
        return [];
    }
    n = len(nums);
    prefix_products = [1] * n;
    suffix_products = [1] * n;
    for i in range(1, n) {
        prefix_products[i] = prefix_products[(i - 1)] * nums[(i - 1)];
    }
    for i in range((n - 2), -1, -1) {
        suffix_products[i] = suffix_products[(i + 1)] * nums[(i + 1)];
    }
    result = [1] * n;
    for i in range(n) {
        result[i] = prefix_products[i] * suffix_products[i];
    }
    return result;
}

