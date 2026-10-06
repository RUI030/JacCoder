"""
    This function takes in an array of integers and returns the length of the longest contiguous subsequence
    wherein all the numbers are even. If there are no even numbers in the array, the function should return 0.
    """
def longest_even_subsequence(arr: list[int]) -> int {
    max_len = 0;
    current_len = 0;
    for num in arr {
        if ((num % 2) == 0) {
            current_len += 1;
            max_len = max(max_len, current_len);
        } else {
            current_len = 0;
        }
    }
    return max_len;
}

