"""
    Returns a list where each element is the product of all numbers in the input list except for the number at that position.
    """
def product_except_self(nums: list[int]) -> list[int] {
    n = len(nums);
    if (n == 0) {
        return [];
    }
    left_products = [1] * n;
    right_products = [1] * n;
    for i in range(1, n) {
        left_products[i] = left_products[(i - 1)] * nums[(i - 1)];
    }
    for i in range((n - 2), -1, -1) {
        right_products[i] = right_products[(i + 1)] * nums[(i + 1)];
    }
    result = [1] * n;
    for i in range(n) {
        result[i] = left_products[i] * right_products[i];
    }
    return result;
}

