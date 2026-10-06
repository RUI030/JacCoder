"""
    Calculates the total effective distance covered by the participants, considering overlaps.

    Parameters:
    L (int): Length of the race track.
    n (int): Number of segments.
    segments (list of tuples): Each tuple (si, ei) represents the start and end points of the segment.

    Returns:
    int: The total effective distance covered.
    """
def effective_coverage(L: int, n: int, segments: list[tuple[int, int]]) -> int {
    track_coverage = [False] * L;
    for (s, e) in segments {
        for i in range(s, e) {
            track_coverage[i] = True;
        }
    }
    effective_distance = sum(track_coverage);
    return effective_distance;
}
with entry {
    segments = [(10, 30), (20, 50), (40, 70)];
    print(effective_coverage(100, 3, segments));
}

