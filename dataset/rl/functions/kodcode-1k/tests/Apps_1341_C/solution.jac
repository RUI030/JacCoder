"""
    Rotates the elements of the array to the right by k steps.
    """
def rotateArray(arr: list[int], k: int) -> list[int] {
    if not arr {
        return arr;
    }
    n = len(arr);
    k = k % n;
    return (arr[-k:] + arr[:-k]);
}

