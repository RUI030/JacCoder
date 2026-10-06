"""
    Returns an array where each element at index 'i' is the product of all the numbers
    in the original array except the one at 'i'.
    """
def product_except_self(nums: list[int]) -> list[int] {
    n = len(nums);
    if (n == 0) {
        return [];
    }
    left_products = [1] * n;
    right_products = [1] * n;
    output = [1] * n;
    for i in range(1, n) {
        left_products[i] = left_products[(i - 1)] * nums[(i - 1)];
    }
    for j in range((n - 2), -1, -1) {
        right_products[j] = right_products[(j + 1)] * nums[(j + 1)];
    }
    for k in range(n) {
        output[k] = left_products[k] * right_products[k];
    }
    return output;
}

