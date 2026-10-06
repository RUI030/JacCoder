# move_common_to_left

Moves elements from commons list to the left side of mylist while maintaining
the order of elements not in the commons list.

>>> move_common_to_left([1, 2, 3, 4, 5], [2, 4]) == [2, 4, 1, 3, 5]
>>> move_common_to_left([1, 2, 3], [4, 5]) == [1, 2, 3]

Implement `move_common_to_left(mylist: list[int], commons: list[int]) -> list[int]`.
