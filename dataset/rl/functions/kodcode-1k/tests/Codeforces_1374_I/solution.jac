"""
    This function returns the number of unique triplets (i, j, k) such that i < j < k and ai + aj = ak.

    Arguments:
    n: an integer representing the number of elements in the list.
    numbers: a list of n positive integers.

    Returns:
    An integer representing the count of unique triplets satisfying the condition.
    """
def count_unique_triplets(n: int, numbers: list[int]) -> int {
    count = 0;
    for k in range(2, n) {
        sums = `set();
        for j in range(k) {
            if ((numbers[k] - numbers[j]) in sums) {
                count += 1;
            }
            sums.add(numbers[j]);
        }
    }
    return count;
}

