"""
    Determines if there are two distinct elements in the list `nums` that add up to `target`.
    Returns "YES" if such elements exist, otherwise "NO".
    """
def find_two_sum(nums: list[int], target: int) -> str {
    seen = `set();
    for num in nums {
        if ((target - num) in seen) {
            return "YES";
        }
        seen.add(num);
    }
    return "NO";
}

