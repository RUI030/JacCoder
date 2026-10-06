"""
    Checks if it is possible to split the list into two non-empty parts with equal sums.
    """
def isPossibleToBalance(arr: list[int]) -> bool {
    total_sum = sum(arr);
    if ((total_sum % 2) != 0) {
        return False;
    }
    half_sum = total_sum // 2;
    current_sum = 0;
    for i in range((len(arr) - 1)) {
        current_sum += arr[i];
        if (current_sum == half_sum) {
            return True;
        }
    }
    return False;
}

