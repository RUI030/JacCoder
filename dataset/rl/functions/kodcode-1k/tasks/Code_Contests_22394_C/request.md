# generate_sequence

Generates a sequence of integers such that |a_k - k| is unique for each k.

Args:
n (int): the length of the sequence to generate

Returns:
List[int]: A list of n integers satisfying the condition that |a_k - k| is unique for each k

Examples:
>>> generate_sequence(1)
[1]

>>> generate_sequence(2)
[1, 2]

Implement `generate_sequence(n: int) -> list[int]`.
