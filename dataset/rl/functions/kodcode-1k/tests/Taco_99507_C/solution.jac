import from typing { List, Tuple }
"""
    Finds the subarray with the maximum sum and returns both the sum and the subarray itself.
    """
def max_subarray_sum(arr: list[int]) -> tuple[int, list[int]] {
    if not arr {
        return (0, []);
    }
    max_sum = current_sum=arr[0];
    start = end=s=0;
    for i in range(1, len(arr)) {
        if ((current_sum + arr[i]) > arr[i]) {
            current_sum += arr[i];
        } else {
            current_sum = arr[i];
            s = i;
        }
        if (current_sum > max_sum) {
            max_sum = current_sum;
            start = s;
            end = i;
        }
    }
    return (max_sum, arr[start:(end + 1)]);
}

