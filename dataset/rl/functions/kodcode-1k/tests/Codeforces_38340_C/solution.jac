"""
    Returns the length of the longest strictly increasing subsequence.
    :param arr: List of distinct integers.
    :return: Integer length of the longest strictly increasing subsequence.
    """
def length_of_lis(arr: list[int]) -> int {
    if not arr {
        return 0;
    }
    n = len(arr);
    lis = [1] * n;
    for i in range(1, n) {
        for j in range(0, i) {
            if ((arr[i] > arr[j]) and (lis[i] < (lis[j] + 1))) {
                lis[i] = lis[j] + 1;
            }
        }
    }
    return max(lis);
}

