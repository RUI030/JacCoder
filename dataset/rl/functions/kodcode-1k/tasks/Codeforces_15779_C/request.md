# check_clear_winner

This function checks if there is a clear winner.
A clear winner is a candidate who has strictly more votes than any other candidate.

Parameters:
    m (int): The number of candidates.
    votes (list): A list of integers where each integer represents the number of votes a candidate received.

Returns:
    str: "YES" if there is a clear winner, otherwise "NO".

>>> check_clear_winner(4, [12, 7, 9, 4])
"YES"
>>> check_clear_winner(3, [5, 9, 5])
"NO"

Implement `check_clear_winner(m: int, votes: list[int]) -> str`.
