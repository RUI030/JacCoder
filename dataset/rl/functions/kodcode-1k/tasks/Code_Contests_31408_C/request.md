# get_winner

Determines the total points of Alex and Bob and declares the winner.

Parameters:
a (int): Total points Alex scored on problems he and Bob both solved
b (int): Total points Bob scored on problems he and Alex both solved
c (int): Total points Alex scored on problems only he solved
d (int): Total points Bob scored on problems only he solved

Returns:
tuple: Total points of Alex, total points of Bob, and the winner ("Alex", "Bob", or "Draw")

>>> get_winner(10, 20, 15, 5)
(25, 25, "Draw")

>>> get_winner(30, 20, 10, 5)
(40, 25, "Alex")

Implement `get_winner(a: int, b: int, c: int, d: int) -> tuple[int, int, str]`.
