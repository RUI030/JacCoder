"""
    Returns the number of ways to partition the integer n into sums of non-negative integers,
    each partition being counted only once ignoring the order of the summands.
    """
def number_of_partitions(n: int) -> int {
    partitions = [0] * (n + 1);
    partitions[0] = 1;
    for num in range(1, (n + 1)) {
        for j in range(num, (n + 1)) {
            partitions[j] += partitions[(j - num)];
        }
    }
    return partitions[n];
}

