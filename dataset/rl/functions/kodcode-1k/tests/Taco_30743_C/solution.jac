"""
    Determines who will win the game (Alice or Bob) given n stones.
    """
def determine_winner(n: int) -> str {
    return "Alice" if ((n % 2) == 1) else "Bob";
}

