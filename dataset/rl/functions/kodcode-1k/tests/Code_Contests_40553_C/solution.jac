"""
    Determines the highest energy value that can be obtained from any path
    connecting two trees.

    :param int n: The number of trees.
    :param list energies: The energy values of the trees.
    :param list connections: The connections between the trees.
    :return: The highest energy value.
    """
def highest_energy_value(n: int, energies: list[int], connections: list[tuple[int, int]]) -> int {
    return max(energies);
}
with entry {
    n = 5;
    energies = [1, 4, 3, 2, 5];
    connections = [(1, 2), (1, 3), (2, 4), (3, 5)];
    print(highest_energy_value(n, energies, connections));
    n = 3;
    energies = [8, 3, 10];
    connections = [(1, 2), (1, 3)];
    print(highest_energy_value(n, energies, connections));
}

