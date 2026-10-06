"""
    Returns a list of all possible contiguous subarrays of length k.
    If the array's length is less than k, returns an empty list.
    """
def find_contiguous_subarrays(arr: list[int], k: int) -> list[list[int]] {
    if (len(arr) < k) {
        return [];
    }
    result = [];
    for i in range(((len(arr) - k) + 1)) {
        result.append(arr[i:(i + k)]);
    }
    return result;
}

