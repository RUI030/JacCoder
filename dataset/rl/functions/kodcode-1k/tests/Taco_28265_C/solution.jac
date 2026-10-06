"""
    Returns the maximum total rarity that can be carried in the backpack.
    :param n: Number of items available in the shop
    :param c: Capacity of the backpack (maximum number of items)
    :param rarities: List of rarity values of the items
    :return: Maximum total rarity
    """
def max_total_rarity(n: int, c: int, rarities: list[int]) -> int {
    rarities.sort(reverse=True);
    return sum(rarities[:c]);
}

