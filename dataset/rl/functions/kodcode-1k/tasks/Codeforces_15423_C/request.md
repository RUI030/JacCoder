# min_streetlights

Determine the minimum number of streetlights required to illuminate the entire road
from position 0 to position m. If it's impossible to illuminate the entire road, return -1.

Args:
n (int): Number of potential streetlight positions.
m (int): Length of the road.
positions (List[int]): Positions where streetlights can be placed.
r (int): Range of each streetlight.

Returns:
int: Minimum number of streetlights required or -1 if impossible.

Examples:
>>> min_streetlights(5, 10, [1, 5, 8, 9, 12], 3)
3

>>> min_streetlights(5, 10, [15, 16, 17, 18, 19], 3)
-1

Implement `min_streetlights(n: int, m: int, positions: list[int], r: int) -> int`.
