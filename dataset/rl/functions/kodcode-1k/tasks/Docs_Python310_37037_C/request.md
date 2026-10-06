# count_bits_and_operate

Write a Jac function named `count_bits_and_operate` that takes a list of integers and performs the following operations:

1. For each integer in the list, count the number of `1` bits in its binary representation using the `bit_count()` method.
2. Return a list of tuples where each tuple contains the original integer and its bit count.
3. Filter out integers with an even number of `1` bits.
4. Compute the cumulative bitwise AND of the remaining integers.
5. Return the list of tuples and the final cumulative bitwise AND result as a tuple.

>>> count_bits_and_operate([3, 5, 7])
([(3, 2), (5, 2), (7, 3)], 7)
>>> count_bits_and_operate([2, 4, 8, 16])
([(2, 1), (4, 1), (8, 1), (16, 1)], 16)

Implement `count_bits_and_operate(int_list: list[int]) -> tuple[list[tuple[int, int]], int]`.
