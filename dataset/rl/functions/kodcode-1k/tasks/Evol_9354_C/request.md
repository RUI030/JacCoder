# sort_by_second_element

Sorts a list of tuples by the second element in each tuple.

Parameters:
tuples_list (list of tuple): List of tuples to be sorted.

Returns:
list of tuple: Sorted list of tuples by the second element.

>>> sort_by_second_element([(3, 5), (2, 1), (4, 7), (1, 4)]) == [(2, 1), (1, 4), (3, 5), (4, 7)]
>>> sort_by_second_element([(1, 2), (2, 2), (3, 2)]) == [(1, 2), (2, 2), (3, 2)]

Implement `sort_by_second_element(tuples_list: list[tuple[int, int]]) -> list[tuple[int, int]]`.
