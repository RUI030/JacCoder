"""
    Determines the minimum number of containers needed so each guest gets exactly one full container.

    :param n: Number of guests
    :param m: Number of types of beverages
    :param containers: List of integers representing the number of containers available for each type of beverage
    :return: Minimum number of containers needed
    """
def min_containers(n: int, m: int, containers: list[int]) -> int {
    containers.sort(reverse=True);
    total_containers = 0;
    for c in containers {
        total_containers += c;
        if (total_containers >= n) {
            return n;
        }
    }
    return total_containers;
}

