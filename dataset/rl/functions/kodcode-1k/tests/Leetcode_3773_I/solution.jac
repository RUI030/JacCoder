"""
    Given an array of `n` unique integers, find the maximum length
    of a contiguous subarray where the difference between the
    minimum and maximum element is at most `k`.

    Parameters:
    nums (List[int]): List of unique integers.
    k (int): The allowed difference between maximum and minimum elements.

    Returns:
    int: Maximum length of the contiguous subarray.
    """
def max_length_subarray(nums: list[int], k: int) -> int {
    if not nums {
        return 0;
    }
    import from collections { deque }
    max_deque = deque();
    min_deque = deque();
    left = 0;
    max_len = 0;
    for right in range(len(nums)) {
        while (max_deque and (nums[max_deque[-1]] <= nums[right])) {
            max_deque.pop();
        }
        max_deque.append(right);
        while (min_deque and (nums[min_deque[-1]] >= nums[right])) {
            min_deque.pop();
        }
        min_deque.append(right);
        while ((nums[max_deque[0]] - nums[min_deque[0]]) > k) {
            left += 1;
            if (max_deque[0] < left) {
                max_deque.popleft();
            }
            if (min_deque[0] < left) {
                min_deque.popleft();
            }
        }
        max_len = max(max_len, ((right - left) + 1));
    }
    return max_len;
}

