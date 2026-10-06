"""
    Returns the maximum bond strength of any contiguous subsequence
    of the given sequence of hexagonal tiles.
    """
def max_bond_strength(bonds: list[int]) -> int {
    max_sum = current_sum=bonds[0];
    for bond in bonds[1:] {
        current_sum = max(bond, (current_sum + bond));
        max_sum = max(max_sum, current_sum);
    }
    return max_sum;
}

