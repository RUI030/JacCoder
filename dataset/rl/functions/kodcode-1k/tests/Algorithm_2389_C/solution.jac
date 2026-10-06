"""
    Calculates the number of contiguous subarrays that sum to a given target value k.

    :param nums: List of integers
    :param k: Target sum
    :return: Number of contiguous subarrays summing to k
    """
def subarray_sum(nums: list[int], k: int) -> int {
    count = 0;
    current_sum = 0;
    sum_counts = {0: 1};
    for num in nums {
        current_sum += num;
        if ((current_sum - k) in sum_counts) {
            count += sum_counts[(current_sum - k)];
        }
        if (current_sum in sum_counts) {
            sum_counts[current_sum] += 1;
        } else {
            sum_counts[current_sum] = 1;
        }
    }
    return count;
}

