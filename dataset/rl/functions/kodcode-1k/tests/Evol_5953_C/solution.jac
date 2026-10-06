"""
    Given a list of integers sorted in non-decreasing order, returns a list of the squares of each number in sorted non-decreasing order.

    Args:
    nums (list): List of integers sorted in non-decreasing order.

    Returns:
    list: List of the squares of each number in sorted non-decreasing order.
    """
def sortedArraySquares(nums: list[int]) -> list[int] {
    n = len(nums);
    result = [0] * n;
    (left, right) = (0, (n - 1));
    index = n - 1;
    while (left <= right) {
        left_square = nums[left] ** 2;
        right_square = nums[right] ** 2;
        if (left_square > right_square) {
            result[index] = left_square;
            left += 1;
        } else {
            result[index] = right_square;
            right -= 1;
        }
        index -= 1;
    }
    return result;
}

