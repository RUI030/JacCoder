# is_broadcastable

Determines if two tensors of given shapes can be broadcast together as per PyTorch's broadcasting rules.

Args:
tensor1_shape (list[int]): shape of the first tensor.
tensor2_shape (list[int]): shape of the second tensor.

Returns:
tuple[bool, list[int]]: A tuple containing a boolean indicating if broadcasting is possible, 
and the resultant shape if broadcasting is possible, else an empty list.

Examples:
>>> is_broadcastable([5, 3, 4, 1], [3, 1, 1])
(True, [5, 3, 4, 1])

>>> is_broadcastable([5, 2, 4, 1], [3, 1, 1])
(False, [])

Implement `is_broadcastable(tensor1_shape: list[int], tensor2_shape: list[int]) -> tuple[bool, list[int]]`.
