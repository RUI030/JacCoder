"""
    Returns the card values sorted in descending order.

    Parameters:
    n (int): Total number of cards.
    card_values (list of int): List of integers representing the card values.

    Returns:
    list of int: The card values sorted in descending order.
    """
def sort_cards_descending(n: int, card_values: list[int]) -> list[int] {
    return sorted(card_values, reverse=True);
}

