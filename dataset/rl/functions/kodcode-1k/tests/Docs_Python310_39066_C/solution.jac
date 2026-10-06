"""
    Mimics Python's slice behavior by using provided start, stop, and step indices.
    """
def custom_slice(input_list: list[int], start: int, stop: int, step: int) -> list[int] {
    if (start is None) {
        start = 0;
    }
    if (step is None) {
        step = 1;
    }
    if (stop is None) {
        stop = len(input_list);
    }
    result = [];
    i = start;
    while (((step > 0) and (i < stop)) or ((step < 0) and (i > stop))) {
        if (0 <= i < len(input_list)) {
            result.append(input_list[i]);
        }
        i += step;
    }
    return result;
}

