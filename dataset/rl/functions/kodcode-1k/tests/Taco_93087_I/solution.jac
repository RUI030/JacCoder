"""
    This function takes an array of integers and returns the smallest positive integer that is not present in the array.
    """
def findMissingPositive(arr: list[int]) -> int {
    arr = [
        num
        for num in arr
        if (num > 0)
    ];
    num_set = `set(arr);
    smallest_missing_positive = 1;
    while (smallest_missing_positive in num_set) {
        smallest_missing_positive += 1;
    }
    return smallest_missing_positive;
}

