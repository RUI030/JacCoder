"""
    Identify the integer in a list which appears exactly one time,
    while every other integer appears exactly three times.
    """
def single_number(nums: list[int]) -> int {
    seen_once = seen_twice=0;
    for num in nums {
        seen_once = ~seen_twice & (seen_once ^ num);
        seen_twice = ~seen_once & (seen_twice ^ num);
    }
    return seen_once;
}

