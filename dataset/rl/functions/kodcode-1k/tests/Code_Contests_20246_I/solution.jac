"""
    Determines the rank of the player at position p.

    Parameters:
    n (int): Number of players.
    scores (list of int): List of scores.
    p (int): Position of the player (1-based index).

    Returns:
    int: The rank of the player at position p.
    """
def determine_rank(n: int, scores: list[int], p: int) -> int {
    player_score = scores[(p - 1)];
    unique_scores = sorted(`set(scores), reverse=True);
    rank = unique_scores.index(player_score) + 1;
    return rank;
}

