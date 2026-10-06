# multiply_lists

Returns a new list where each element is the product of the corresponding 
elements from the input lists. If one list is shorter than the other, append 
the remaining elements of the longer list as they are to the end of the output list.

>>> multiply_lists([1, 2, 3], [4, 5, 6])
[4, 10, 18]
>>> multiply_lists([1, 2, 3], [4, 5])
[4, 10, 3]

Implement `multiply_lists(list1: list[int], list2: list[int]) -> list[int]`.
