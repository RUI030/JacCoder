def product_except_self(nums: list[int]) -> list[int] {
    n = len(nums);
    results = [1] * n;
    left_product = 1;
    for i in range(n) {
        results[i] = left_product;
        left_product *= nums[i];
    }
    right_product = 1;
    for i in range((n - 1), -1, -1) {
        results[i] *= right_product;
        right_product *= nums[i];
    }
    return results;
}

