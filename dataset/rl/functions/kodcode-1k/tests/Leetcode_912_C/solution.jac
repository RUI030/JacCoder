"""
    Returns the minimum sum of absolute differences between array1 and array2
    after performing the allowed swap operations.
    """
def min_absolute_sum_difference(array1: list[int], array2: list[int]) -> int {
    initial_sum = sum(abs((a - b)) for (a, b) in zip(array1, array2));
    if (initial_sum == 0) {
        return 0;
    }
    sorted1 = sorted(array1);
    sorted2 = sorted(array2);
    min_sum = 0;
    for i in range(len(array1)) {
        diff = min(abs((array1[i] - array2[i])), abs((array1[i] - sorted2[i])));
        min_sum += diff;
    }
    return min_sum;
}

