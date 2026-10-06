"""
    Returns the maximum number of buds that can be bloomed without exceeding the available magic points.

    Parameters:
    N (int): Number of buds on the tree.
    M (int): Total available magic points.
    energy_levels (list of ints): A list containing the energy requirement of each bud.

    Returns:
    int: Maximum number of buds that can be bloomed.
    """
def max_bloomed_buds(N: int, M: int, energy_levels: list[int]) -> int {
    energy_levels.sort();
    total_energy = 0;
    count = 0;
    for energy in energy_levels {
        if ((total_energy + energy) <= M) {
            total_energy += energy;
            count += 1;
        } else {
            break;
        }
    }
    return count;
}

