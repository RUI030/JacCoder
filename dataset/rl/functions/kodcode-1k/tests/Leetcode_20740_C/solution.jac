"""
    Determines if it is possible to rearrange the binary array `nums` such that
    all `1`s appear before all `0`s using the allowed operations.
    """
def can_rearrange(nums: list[int]) -> bool {
    found_zero = False;
    for num in nums {
        if (num == 0) {
            found_zero = True;
        } elif (found_zero and (num == 1)) {
            return False;
        }
    }
    return True;
}

