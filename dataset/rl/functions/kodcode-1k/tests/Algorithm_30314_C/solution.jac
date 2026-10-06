"""
    Return the number of ways to represent k as the sum of consecutive positive integers.
    """
def count_consecutive_sums(k: int) -> int {
    count = 0;
    for m in range(1, (k + 1)) {
        sum_m_minus_1 = (m * (m - 1)) // 2;
        if (sum_m_minus_1 >= k) {
            break;
        }
        if (((k - sum_m_minus_1) % m) == 0) {
            count += 1;
        }
    }
    return count;
}

