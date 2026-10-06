"""
    Returns the maximum number of cards that can be collected in increasing order of their values.
    """
def max_cards(n: int, cards: list[int]) -> int {
    import from bisect { bisect_left }
    lis = [];
    for card in cards {
        pos = bisect_left(lis, card);
        if (pos == len(lis)) {
            lis.append(card);
        } else {
            lis[pos] = card;
        }
    }
    return len(lis);
}

