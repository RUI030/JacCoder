"""
    Mimics the behavior of slicing for a given sequence, within the bounds specified.

    Args:
    sequence (list): The list to be sliced.
    start (int): The start index of the slice.
    stop (int): The stop index of the slice.
    step (int): The step value of the slice.

    Returns:
    list: The sliced list.
    """
def custom_slice(sequence: list[int], start: int, stop: int, step: int) -> list[int] {
    if (step == 0) {
        raise ValueError("slice step cannot be zero");
    }
    length = len(sequence);
    if (start is None) {
        start = 0;
    } elif (start < 0) {
        start += length;
    }
    if (stop is None) {
        stop = length;
    } elif (stop < 0) {
        stop += length;
    }
    start = max(min(start, length), 0);
    stop = max(min(stop, length), 0);
    result = [];
    if (step > 0) {
        i = start;
        while (i < stop) {
            result.append(sequence[i]);
            i += step;
        }
    } else {
        i = start;
        while (i > stop) {
            result.append(sequence[i]);
            i += step;
        }
    }
    return result;
}

