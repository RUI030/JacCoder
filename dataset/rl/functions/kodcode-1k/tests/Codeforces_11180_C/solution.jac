def max_sum_with_one_removal(arr: list[int]) -> int {
    n = len(arr);
    if (n == 1) {
        return arr[0];
    }
    max_ending_here = [0] * n;
    max_starting_here = [0] * n;
    max_ending_here[0] = arr[0];
    max_starting_here[(n - 1)] = arr[(n - 1)];
    for i in range(1, n) {
        max_ending_here[i] = max(arr[i], (max_ending_here[(i - 1)] + arr[i]));
    }
    for i in range((n - 2), -1, -1) {
        max_starting_here[i] = max(arr[i], (max_starting_here[(i + 1)] + arr[i]));
    }
    max_subarray_sum = max(max_ending_here);
    for i in range(1, (n - 1)) {
        max_subarray_sum = max(
            max_subarray_sum, (max_ending_here[(i - 1)] + max_starting_here[(i + 1)])
        );
    }
    return max_subarray_sum;
}

