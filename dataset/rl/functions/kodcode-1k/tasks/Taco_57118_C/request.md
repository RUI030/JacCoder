# process_scores

Process the list of scores and output the highest score, 
the lowest score, and the average score (rounded down).

Args:
scores_str (str): A space-separated string of integer scores.

Returns:
tuple: A tuple containing the highest score, the lowest score, 
       and the average score (rounded down), in that order.

Examples:
>>> process_scores("23 67 89 45 32 55 90 100 54 20")
(100, 20, 57)
>>> process_scores("50 50 50 50")
(50, 50, 50)

Implement `process_scores(scores_str: str) -> tuple[int, int, int]`.
