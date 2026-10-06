# shiftZeroesToEnd

Shifts all zeros to the end of the list while maintaining the relative order of the other elements.
Args:
    nums (list of int): The list of integers to be modified.
Returns:
    list of int: The modified list with all zeros moved to the end.

>>> shiftZeroesToEnd([0, 1, 0, 3, 12])
[1, 3, 12, 0, 0]
>>> shiftZeroesToEnd([0, 0, 1])
[1, 0, 0]

Implement `shiftZeroesToEnd(nums: list[int]) -> list[int]`.
