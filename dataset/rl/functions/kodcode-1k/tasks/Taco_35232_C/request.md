# max_bloomed_buds

Returns the maximum number of buds that can be bloomed without exceeding the available magic points.

Parameters:
N (int): Number of buds on the tree.
M (int): Total available magic points.
energy_levels (list of ints): A list containing the energy requirement of each bud.

Returns:
int: Maximum number of buds that can be bloomed.

>>> max_bloomed_buds(5, 10, [2, 2, 2, 3, 4])
4
>>> max_bloomed_buds(4, 5, [5, 5, 5, 5])
1

Implement `max_bloomed_buds(N: int, M: int, energy_levels: list[int]) -> int`.
