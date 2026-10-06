"""
    Adjust the capacity of each segment to at least meet the passenger load,
    and find the minimum total capacity increase required.

    :param n: Number of stops
    :param segments: List of tuples of the form (ci, pi) representing the capacity
                     and passenger load of each segment.
    :return: Minimum total capacity increase and new capacities of each segment.
    """
def balance_bus_capacity(n: int, segments: list[tuple[int, int]]) -> tuple[int, list[int]] {
    total_increase = 0;
    new_capacities = [];
    for (ci, pi) in segments {
        if (ci < pi) {
            total_increase += pi - ci;
            new_capacities.append(pi);
        } else {
            new_capacities.append(ci);
        }
    }
    return (total_increase, new_capacities);
}

