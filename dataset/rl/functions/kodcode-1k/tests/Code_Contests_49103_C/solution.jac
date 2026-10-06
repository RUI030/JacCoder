"""
    Determines if there exists a subarray with a sum of zero.

    :param arr: List of integers.
    :return: "Yes" if there exists a subarray with zero sum, "No" otherwise.
    """
def does_subarray_with_zero_sum_exist(arr: list[int]) -> str {
    sum_seen = `set();
    sum_so_far = 0;
    for num in arr {
        sum_so_far += num;
        if ((sum_so_far == 0) or (sum_so_far in sum_seen)) {
            return "Yes";
        }
        sum_seen.add(sum_so_far);
    }
    return "No";
}

