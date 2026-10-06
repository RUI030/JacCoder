"""
    Determines if there are four distinct elements in arr that sum up to target.

    :param arr: List[int], the input integer array.
    :param target: int, the target sum.
    :return: bool, True if there exist four distinct elements that sum up to target, otherwise False.
    """
def four_sum(arr: list[int], target: int) -> bool {
    arr.sort();
    n = len(arr);
    for i in range((n - 3)) {
        for j in range((i + 1), (n - 2)) {
            left = j + 1;
            right = n - 1;
            while (left < right) {
                current_sum = arr[i] + arr[j] + arr[left] + arr[right];
                if (current_sum == target) {
                    return True;
                } elif (current_sum < target) {
                    left += 1;
                } else {
                    right -= 1;
                }
            }
        }
    }
    return False;
}

