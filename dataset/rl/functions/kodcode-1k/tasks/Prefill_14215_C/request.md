# find_list_with_most_elements_sum_to_target

Create a function that takes two lists of integers and returns the list that contains the most elements
that add up to the target value. If both lists have the same number of elements that sum up to the target,
return the first list. If neither list meets the criteria, return an empty list.

>>> find_list_with_most_elements_sum_to_target([1, 2, 3, 4], [2, 2, 3, 4], 2)
[2, 2, 3, 4]
>>> find_list_with_most_elements_sum_to_target([1, 2, 3, 4], [1, 2, 2, 4], 2)
[1, 2, 2, 4]

Implement `find_list_with_most_elements_sum_to_target(list1: list[int], list2: list[int], target: int) -> list[int]`.
