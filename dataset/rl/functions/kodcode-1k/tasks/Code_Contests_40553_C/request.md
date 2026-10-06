# highest_energy_value

Determines the highest energy value that can be obtained from any path connecting two trees.

:param n: Number of trees.
:param energies: Energy values of the trees.
:param connections: List of connections between the trees.
:return: Highest energy value from any path connecting two trees.

>>> highest_energy_value(5, [1, 4, 3, 2, 5], [(1, 2), (1, 3), (2, 4), (3, 5)])
5
>>> highest_energy_value(3, [8, 3, 10], [(1, 2), (1, 3)])
10

Implement `highest_energy_value(n: int, energies: list[int], connections: list[tuple[int, int]]) -> int`.
