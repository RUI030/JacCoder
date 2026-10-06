# effective_coverage

Calculates the total effective distance covered by the participants, considering overlaps.

Parameters:
L (int): Length of the race track.
n (int): Number of segments.
segments (List[Tuple[int, int]]): Each tuple (si, ei) represents the start and end points of the segment.

Returns:
int: The total effective distance covered.

>>> effective_coverage(100, 3, [(10, 30), (20, 50), (40, 70)]) 60
>>> effective_coverage(100, 1, [(0, 100)]) 100

Implement `effective_coverage(L: int, n: int, segments: list[tuple[int, int]]) -> int`.
