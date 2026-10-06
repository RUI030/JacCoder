# verify_buffer_structure

Verify if a memory buffer's structure is valid, based on the provided buffer parameters.

Args:
memlen (int): Length of the physical memory block.
itemsize (int): Size of each item in the buffer (in bytes).
ndim (int): Number of dimensions for the n-dimensional array.
shape (Optional[List[int]]): Shape of the memory as an n-dimensional array. Can be None if ndim is 0.
strides (Optional[List[int]]): Number of bytes to skip to get to a new element in each dimension. Can be None if ndim is 0.
offset (int): Offset of the buffer's start location in the memory block.

Returns:
bool: True if the buffer structure is valid, False if the buffer structure is invalid.

Examples:
>>> verify_buffer_structure(100, 4, 2, [5, 5], [20, 4], 0)
True
>>> verify_buffer_structure(100, 4, 2, [5, 5], [20, 4], 101)
False

Implement `verify_buffer_structure(memlen: int, itemsize: int, ndim: int, shape: list[int] | None, strides: list[int] | None, offset: int) -> bool`.
