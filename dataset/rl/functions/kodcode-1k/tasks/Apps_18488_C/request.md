# max_cards

Returns the maximum number of cards that can be collected in increasing order of their values.

Parameters:
n (int): The number of cards available.
cards (List[int]): A list of integers representing the value of each card in the order they are presented.

Returns:
int: The maximum number of cards a player can collect in increasing order of their values.

Example:
>>> max_cards(6, [3, 1, 2, 5, 6, 4])
4
>>> max_cards(1, [100])
1

Implement `max_cards(n: int, cards: list[int]) -> int`.
