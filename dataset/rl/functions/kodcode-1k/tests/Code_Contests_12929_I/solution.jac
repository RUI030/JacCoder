"""
    Reconstructs the list according to the provided operations.

    :param n: Number of elements in the list
    :param elements: List of integers
    :return: A new list after the given operations
    """
def reconstruct_list(n: int, elements: list[int]) -> list[int] {
    unique_elements = sorted(`set(elements));
    result = [];
    current_sum = 0;
    for elem in unique_elements {
        current_sum += elem;
        result.append(current_sum);
    }
    return result;
}

