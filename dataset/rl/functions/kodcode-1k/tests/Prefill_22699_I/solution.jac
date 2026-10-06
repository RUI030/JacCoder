"""
    Returns an array where each element is the sum of itself and the next element in the input array.
    If the input array has only one element, the array contains that single element repeated.
    """
def sum_with_next(arr: list[int]) -> list[int] {
    if not arr {
        return [];
    }
    if (len(arr) == 1) {
        return [arr[0], arr[0]];
    }
    result = [];
    for i in range((len(arr) - 1)) {
        result.append((arr[i] + arr[(i + 1)]));
    }
    result.append(arr[-1]);
    return result;
}

