"""
    Returns the maximum number in the provided array.
    """
def find_maximum(arr: list[int]) -> int | None {
    if not arr {
        return None;
    }
    maximum = arr[0];
    for num in arr {
        if (num > maximum) {
            maximum = num;
        }
    }
    return maximum;
}

