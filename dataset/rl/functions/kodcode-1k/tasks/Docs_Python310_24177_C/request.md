# analyze_bit_counts

Analyzes a list of integers and returns a dictionary where each key is an integer
and each value is a tuple containing the binary representation of the integer
and the count of ones in its binary representation.

Parameters:
integers (list): A list of integers.

Returns:
dict: A dictionary mapping each integer to a tuple with its binary representation
      and the count of ones in its binary representation.

>>> analyze_bit_counts([3, 7])
{3: ('0b11', 2), 7: ('0b111', 3)}

>>> analyze_bit_counts([-5, -8])
{-5: ('-0b101', 2), -8: ('-0b1000', 1)}

Implement `analyze_bit_counts(integers: list[int]) -> dict[int, tuple[str, int]]`.
