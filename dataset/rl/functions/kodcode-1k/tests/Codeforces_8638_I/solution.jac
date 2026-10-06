"""
    Returns the number of pairs (i, j) such that 1 <= i < j <= n and a[i] + a[j] is even.

    Parameters:
    n (int): The length of the array.
    a (list): The list of integers.

    Returns:
    int: The count of pairs with an even sum.
    """
def count_even_sum_pairs(n: int, a: list[int]) -> int {
    even_count = 0;
    odd_count = 0;
    for number in a {
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

