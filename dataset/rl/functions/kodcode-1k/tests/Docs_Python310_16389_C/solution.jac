"""
    Creates a new slice object with the given start, stop, and step values,
    and adjusts these values for a sequence with the specified length.

    Parameters:
    start (int): The starting index of the slice.
    stop (int): The stopping index of the slice.
    step (int): The step value of the slice.
    length (int): The length of the sequence.

    Returns:
    tuple: A tuple (adjusted_start, adjusted_stop, adjusted_step, slice_length)
           where adjusted_start, adjusted_stop, and adjusted_step are the adjusted
           slice indices, and slice_length is the length of the resulting slice.
    """
def create_and_adjust_slice(start: int | None, stop: int | None, step: int, length: int) -> tuple[int, int, int, int] {
    if (step == 0) {
        raise ValueError("Step must be a non-zero integer.");
    }
    if (start is None) {
        start = 0 if (step > 0) else (length - 1);
    } elif (start < 0) {
        start += length;
        if (start < 0) {
            start = 0 if (step > 0) else -1;
        }
    } elif (start >= length) {
        start = length if (step > 0) else (length - 1);
    }
    if (stop is None) {
        stop = length if (step > 0) else -1;
    } elif (stop < 0) {
        stop += length;
        if (stop < 0) {
            stop = -1;
        }
    } elif (stop >= length) {
        stop = length if (step > 0) else (length - 1);
    }
    if (step > 0) {
        slice_length = max(0, (((stop - start) + (step - 1)) // step));
    } else {
        slice_length = max(0, ((start - stop - (step + 1)) // -step));
    }
    return (start, stop, step, slice_length);
}

