# lexicographically_smallest_sequence

Returns the lexicographically smallest sequence achievable by at most one swap.

Args:
N (int): The number of elements in the sequence.
sequence (List[int]): The sequence of integers.

Returns:
List[int]: The lexicographically smallest sequence possible after at most one swap.

Examples:
>>> lexicographically_smallest_sequence(4, [4, 3, 2, 1])
[1, 3, 2, 4]
>>> lexicographically_smallest_sequence(3, [1, 2, 3])
[1, 2, 3]

Implement `lexicographically_smallest_sequence(N: int, sequence: list[int]) -> list[int]`.
