"""
    Determines if it is possible to distribute coins such that every possible sum of any subset of the coins is unique.

    Args:
    n : int : number of different coin values
    coin_values : list : a list of integers representing the coin values

    Returns:
    str : "YES" if possible, otherwise "NO"
    """
def is_unique_sum_possible(n: int, coin_values: list[int]) -> str {
    coin_values.sort();
    for i in range(1, n) {
        if (coin_values[i] == coin_values[(i - 1)]) {
            return "NO";
        }
    }
    return "YES";
}

