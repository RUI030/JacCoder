"""
    Returns the maximum sum of the products of corresponding elements
    from two identical n-length arrays A and B, where B is a rotation of A.
    """
def max_sum_of_product(arr: list[int]) -> int {
    n = len(arr);
    arr_sorted = sorted(arr);
    max_sum = 0;
    for i in range(n) {
        max_sum += arr_sorted[i] * arr_sorted[i];
    }
    return max_sum;
}

