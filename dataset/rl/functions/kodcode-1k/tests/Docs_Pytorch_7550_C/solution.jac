"""
    Determines if two tensors of given shapes can be broadcast together.

    Args:
    tensor1_shape (list[int]): shape of the first tensor.
    tensor2_shape (list[int]): shape of the second tensor.

    Returns:
    tuple[bool, list[int]]: A tuple containing a boolean indicating if broadcasting is possible,
                            and the resultant shape if broadcasting is possible, else an empty list.
    """
def is_broadcastable(tensor1_shape: list[int], tensor2_shape: list[int]) -> tuple[bool, list[int]] {
    reversed_shape1 = tensor1_shape[::-1];
    reversed_shape2 = tensor2_shape[::-1];
    result_shape = [];
    for (dim1, dim2) in zip(reversed_shape1, reversed_shape2) {
        if ((dim1 == dim2) or (dim1 == 1) or (dim2 == 1)) {
            result_shape.append(max(dim1, dim2));
        } else {
            return (False, []);
        }
    }
    result_shape += reversed_shape1[len(result_shape):]
        if (len(reversed_shape1) > len(reversed_shape2))
        else reversed_shape2[len(result_shape):];
    return (True, result_shape[::-1]);
}

