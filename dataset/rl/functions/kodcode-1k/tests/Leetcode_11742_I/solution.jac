"""
    This function takes an array of integers and returns the minimum number of subarrays
    such that the sum of elements in each subarray is odd.
    If it's not possible to partition, it returns -1.
    """
def min_odd_subarrays(nums: list[int]) -> int {
    count_odd = 0;
    for num in nums {
        if ((num % 2) != 0) {
            count_odd += 1;
        }
    }
    if (count_odd == 0) {
        return -1;
    }
    return count_odd;
}

