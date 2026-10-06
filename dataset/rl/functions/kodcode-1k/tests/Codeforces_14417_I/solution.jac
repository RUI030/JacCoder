"""
    Returns a list of indices of players who will remain undefeated.
    """
def find_undefeated_players(scores: list[int]) -> list[int] {
    n = len(scores);
    max_score = max(scores);
    undefeated_indices = [
        i
        for i in range(n)
        if (scores[i] == max_score)
    ];
    return undefeated_indices;
}

