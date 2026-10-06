"""
    Returns the maximum number of fruits that can be collected by picking from exactly K consecutive trees.

    :param N: int, number of trees
    :param K: int, number of consecutive trees to pick from
    :param fruits: list of int, number of fruits on each tree
    :return: int, maximum number of fruits collectible from exactly K consecutive trees
    """
def max_fruits(N: int, K: int, fruits: list[int]) -> int {
    max_fruits_collected = 0;
    current_sum = sum(fruits[:K]);
    max_fruits_collected = current_sum;
    for i in range(K, N) {
        current_sum += fruits[i] - fruits[(i - K)];
        if (current_sum > max_fruits_collected) {
            max_fruits_collected = current_sum;
        }
    }
    return max_fruits_collected;
}

