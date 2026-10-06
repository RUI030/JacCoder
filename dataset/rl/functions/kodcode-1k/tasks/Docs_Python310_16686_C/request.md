# modify_set

Modify a set by adding and removing elements.

:param iterable: An iterable of initial elements to create the set.
:param to_add: An iterable of elements to add to the set.
:param to_remove: An iterable of elements to remove from the set (if they exist).
:return: Modified set after additions and removals.

>>> modify_set([1, 2, 3], [3, 4], [1, 5]) == {2, 3, 4}
>>> modify_set([1, 2], [3, 4], []) == {1, 2, 3, 4}

Implement `modify_set(iterable: list[int], to_add: list[int], to_remove: list[int]) -> set[int]`.
