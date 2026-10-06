"""
    Returns the minimum number of operations to reduce the number of stacks to exactly k.
    """
def min_operations_to_reduce_stacks(n: int, k: int, coins: list[int]) -> int {
    removal_count = n - k;
    coins.sort();
    min_operations = sum(coins[:removal_count]);
    return min_operations;
}

