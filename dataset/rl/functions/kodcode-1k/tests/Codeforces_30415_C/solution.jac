"""
    Determines the winner of the game between Alice and Bob.
    Alice starts first and the game continues with each player removing one character in turns.
    The winner is the one who, after their move, leaves a string with no repeated characters.
    If the string already has no repeated characters at the beginning of someone's turn, they immediately lose.

    :param s: Input string consisting of lowercase English letters.
    :return: "Alice" if Alice has a winning strategy, otherwise "Bob".
    """
def winner_of_game(s: str) -> str {
    import from collections { Counter }
    char_count = Counter(s);
    for count in char_count.values() {
        if (count > 1) {
            return "Alice";
        }
    }
    return "Bob";
}

