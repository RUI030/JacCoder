"""
    Returns True if there exist two distinct indices i and j in
    the array such that arr[i] + arr[j] equals the target sum,
    otherwise returns False.
    """
def hasPairWithSum(arr: list[int], N: int, target: int) -> bool {
    seen = `set();
    for num in arr {
        if ((target - num) in seen) {
            return True;
        }
        seen.add(num);
    }
    return False;
}

