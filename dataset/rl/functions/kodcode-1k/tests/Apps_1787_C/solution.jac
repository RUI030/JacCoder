"""
    Returns the single integer that appears only once in the array.
    The function uses XOR to achieve O(n) time complexity and O(1) space complexity.
    """
def single_number(nums: list[int]) -> int {
    unique_number = 0;
    for num in nums {
        unique_number ^= num;
    }
    return unique_number;
}

