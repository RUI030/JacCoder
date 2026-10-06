"""
    Returns the minimum number of moves required to make the string alternating.
    """
def min_moves_to_alternate(s: str) -> int {
    pattern1 = "ab" * ((len(s) // 2) + 1);
    pattern2 = "ba" * ((len(s) // 2) + 1);
    changes_p1 = sum((c1 != c2) for (c1, c2) in zip(s, pattern1));
    changes_p2 = sum((c1 != c2) for (c1, c2) in zip(s, pattern2));
    return min(changes_p1, changes_p2);
}

