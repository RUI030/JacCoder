"""
    Modify a set by adding and removing elements.

    :param iterable: An iterable of initial elements to create the set.
    :param to_add: An iterable of elements to add to the set.
    :param to_remove: An iterable of elements to remove from the set (if they exist).
    :return: Modified set after additions and removals.
    """
def modify_set(iterable: list[int], to_add: list[int], to_remove: list[int]) -> set[int] {
    result_set = `set(iterable);
    for elem in to_add {
        result_set.add(elem);
    }
    for elem in to_remove {
        result_set.discard(elem);
    }
    return result_set;
}

