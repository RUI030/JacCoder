# create_and_adjust_slice

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

>>> create_and_adjust_slice(2, 10, 2, 5)
(2, 5, 2, 2)
>>> create_and_adjust_slice(-1, 10, 1, 5)
(4, 5, 1, 1)

Implement `create_and_adjust_slice(start: int | None, stop: int | None, step: int, length: int) -> tuple[int, int, int, int]`.
