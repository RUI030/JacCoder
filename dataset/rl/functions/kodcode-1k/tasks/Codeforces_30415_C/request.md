# winner_of_game

Determines the winner of the game between Alice and Bob.
Alice starts first and the game continues with each player removing one character in turns.
The winner is the one who, after their move, leaves a string with no repeated characters.
If the string already has no repeated characters at the beginning of someone's turn, they immediately lose.

:param s: Input string consisting of lowercase English letters.
:return: "Alice" if Alice has a winning strategy, otherwise "Bob".

>>> winner_of_game("abac")
"Alice"
>>> winner_of_game("aabbcc")
"Alice"

Implement `winner_of_game(s: str) -> str`.
