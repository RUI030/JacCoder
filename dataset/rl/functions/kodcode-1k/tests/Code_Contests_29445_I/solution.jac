"""
    Determines the winner of the round or if a tiebreaker is needed.

    :param n: Number of games played (int)
    :param results: Results of the games (str)
    :return: 'A' if player A is the winner, 'B' if player B is the winner, or 'T' if a tiebreaker is needed.
    """
def determine_round_winner(n: int, results: str) -> str {
    count_A = results.count('A');
    count_B = results.count('B');
    if (count_A > count_B) {
        return 'A';
    } elif (count_B > count_A) {
        return 'B';
    } else {
        return 'T';
    }
}

