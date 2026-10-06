# reorganize_list

Reorganizes the list such that each distinct integer appears at most N times,
while maintaining the original order of elements.

Args:
lst (List[int]): A list of integers to be reorganized.
N (int): Maximum allowed occurrences of each element.

Returns:
List[int]: A list containing elements from the original list with no element appearing more than N times.

Examples:
>>> reorganize_list([1,2,3,1,2,1,2,3], 2)
[1, 2, 3, 1, 2, 3]

>>> reorganize_list([20, 37, 20, 21], 1)
[20, 37, 21]

Implement `reorganize_list(lst: list[int], N: int) -> list[int]`.
