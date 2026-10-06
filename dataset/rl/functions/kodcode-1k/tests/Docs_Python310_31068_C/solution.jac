import from typing { List, Optional }
def verify_buffer_structure(memlen: int, itemsize: int, ndim: int, shape: list[int] | None, strides: list[int] | None, offset: int) -> bool {
    if (ndim == 0) {
        return (
            (shape is None)
            and (strides is None)
            and (0 <= offset < memlen)
            and ((offset % itemsize) == 0)
        );
    }
    if (
        (shape is None)
        or (strides is None)
        or (len(shape) != ndim)
        or (len(strides) != ndim)
    ) {
        return False;
    }
    if (offset % itemsize) {
        return False;
    }
    if ((offset < 0) or ((offset + itemsize) > memlen)) {
        return False;
    }
    if `any((v % itemsize) for v in strides) {
        return False;
    }
    if (0 in shape) {
        return True;
    }
    imin = sum(
        (strides[j] * (shape[j] - 1))
        for j in range(ndim)
        if (strides[j] <= 0)
    );
    imax = sum(
        (strides[j] * (shape[j] - 1))
        for j in range(ndim)
        if (strides[j] > 0)
    );
    return ((0 <= (offset + imin)) and ((offset + imax + itemsize) <= memlen));
}

