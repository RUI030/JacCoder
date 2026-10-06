"""
    Returns the number of pairs of indices (i, j) such that 1 ≤ i < j ≤ n
    and the sum of array[i] and array[j] is an even number.
    """
def count_even_sum_pairs(n: int, array: list[int]) -> int {
    even_count = 0;
    odd_count = 0;
    for number in array {
        if ((number % 2) == 0) {
            even_count += 1;
        } else {
            odd_count += 1;
        }
    }
    even_pairs = (even_count * (even_count - 1)) // 2;
    odd_pairs = (odd_count * (odd_count - 1)) // 2;
    return (even_pairs + odd_pairs);
}

