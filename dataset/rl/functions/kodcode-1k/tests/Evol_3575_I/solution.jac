"""
    Returns a list of products where each element is the product of all the integers
    in the original list except the one at the current index. Division is not allowed.
    """
def product_except_self(nums: list[int]) -> list[int] {
    length = len(nums);
    output = [1] * length;
    prefix = 1;
    for i in range(length) {
        output[i] = prefix;
        prefix *= nums[i];
    }
    suffix = 1;
    for i in range((length - 1), -1, -1) {
        output[i] *= suffix;
        suffix *= nums[i];
    }
    return output;
}

