"""
    Process the list of scores and output the highest score,
    the lowest score, and the average score (rounded down).

    Args:
    scores_str (str): A space-separated string of integer scores.

    Returns:
    tuple: A tuple containing the highest score, the lowest score,
           and the average score (rounded down), in that order.
    """
def process_scores(scores_str: str) -> tuple[int, int, int] {
    scores = `list(map(int, scores_str.split()));
    highest_score = max(scores);
    lowest_score = min(scores);
    average_score = sum(scores) // len(scores);
    return (highest_score, lowest_score, average_score);
}

