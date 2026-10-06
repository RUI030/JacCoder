"""
    Function to determine if a subarray exists that sums to a given target value.

    :param arr: List of integers
    :param target: Target sum for the subarray
    :return: Boolean indicating the existence of such a subarray
    """
def subarray_sum(arr: list[int], target: int) -> bool {
    cum_sum_dict = {};
    cum_sum = 0;
    for (index, value) in enumerate(arr) {
        cum_sum += value;
        if (cum_sum == target) {
            return True;
        }
        if ((cum_sum - target) in cum_sum_dict) {
            return True;
        }
        cum_sum_dict[cum_sum] = index;
    }
    return False;
}

