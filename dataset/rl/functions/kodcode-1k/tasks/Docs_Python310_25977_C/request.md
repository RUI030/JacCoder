# custom_slice

Mimics the behavior of slicing for a given sequence, within the bounds specified.

Args:
sequence (list): The list to be sliced.
start (int): The start index of the slice.
stop (int): The stop index of the slice.
step (int): The step value of the slice.

Returns:
list: The sliced list.

>>> custom_slice([1, 2, 3, 4, 5], 1, 4, 1)
[2, 3, 4]
>>> custom_slice([], 0, 3, 1)
[]

Implement `custom_slice(sequence: list[int], start: int, stop: int, step: int) -> list[int]`.
