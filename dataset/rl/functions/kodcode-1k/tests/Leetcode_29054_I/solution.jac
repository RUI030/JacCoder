"""
    Returns the pair of indices [i, j] such that arr[i] + arr[j] == t, where i < j.
    If no such pair exists, returns [-1, -1].

    :param arr: List[int], a sorted array of distinct integers
    :param t: int, the target sum
    :return: List[int], the pair of indices or [-1, -1] if no such pair exists
    """
def find_pair_with_sum(arr: list[int], t: int) -> list[int] {
    (left, right) = (0, (len(arr) - 1));
    while (left < right) {
        current_sum = arr[left] + arr[right];
        if (current_sum == t) {
            return [left, right];
        } elif (current_sum < t) {
            left += 1;
        } else {
            right -= 1;
        }
    }
    return [-1, -1];
}

