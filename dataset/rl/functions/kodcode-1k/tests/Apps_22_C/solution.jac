"""
    Compresses an input array by removing all adjacent duplicate elements.

    Args:
    arr (list of int): The input array.

    Returns:
    list of int: The compressed array.
    """
def compress_array(arr: list[int]) -> list[int] {
    if not arr {
        return [];
    }
    compressed = [arr[0]];
    for i in range(1, len(arr)) {
        if (arr[i] != arr[(i - 1)]) {
            compressed.append(arr[i]);
        }
    }
    return compressed;
}

