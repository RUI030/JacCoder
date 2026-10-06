"""
    This function checks if there is a clear winner.
    A clear winner is a candidate who has strictly more votes than any other candidate.

    Parameters:
        m (int): The number of candidates.
        votes (list): A list of integers where each integer represents the number of votes a candidate received.

    Returns:
        str: "YES" if there is a clear winner, otherwise "NO".
    """
def check_clear_winner(m: int, votes: list[int]) -> str {
    max_votes = max(votes);
    if (votes.count(max_votes) == 1) {
        return "YES";
    } else {
        return "NO";
    }
}

