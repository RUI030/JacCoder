"""
    Determines if there are three distinct elements in arr that add up to the target.

    Parameters:
        arr (list): List of positive integers.
        target (int): The target sum.

    Returns:
        bool: True if there exist three distinct elements that add up to the target, False otherwise.
    """
def three_sum(arr: list[int], target: int) -> bool {
    arr.sort();
    n = len(arr);
    for i in range((n - 2)) {
        (left, right) = ((i + 1), (n - 1));
        while (left < right) {
            current_sum = arr[i] + arr[left] + arr[right];
            if (current_sum == target) {
                return True;
            } elif (current_sum < target) {
                left += 1;
            } else {
                right -= 1;
            }
        }
    }
    return False;
}

