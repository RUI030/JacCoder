"""
    Determines whether the array contains duplicates within a k distance.

    :param nums: List[int], array of integers
    :param k: int, maximum allowed distance
    :return: str, "YES" if there are duplicates within a k distance, otherwise "NO"
    """
def contains_nearby_duplicates(nums: list[int], k: int) -> str {
    seen = {};
    for (i, num) in enumerate(nums) {
        if ((num in seen) and ((i - seen[num]) <= k)) {
            return "YES";
        }
        seen[num] = i;
    }
    return "NO";
}

