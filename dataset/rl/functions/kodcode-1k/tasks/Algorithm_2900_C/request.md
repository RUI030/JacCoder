# sum_excluding_elements

Computes the sum of all elements in the input array, excluding the specified elements.

Parameters:
    - arr (List[int]): The main list containing the elements to sum.
    - exclude (List[int]): The list of elements that should not be included in the sum.

Returns:
    int: The sum of elements in `arr`, excluding those present in `exclude`.

>>> sum_excluding_elements([2, 1, 4, 5, 2, 4], [2, 4])
6
>>> sum_excluding_elements([0, 3, 1, 0, 1], [0, 1])
3

Implement `sum_excluding_elements(arr: list[int], exclude: list[int]) -> int`.
