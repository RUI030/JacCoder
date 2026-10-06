"""
    Simulates the growth of bacteria under given conditions.

    The population doubles every hour for the first 2 hours, triples every hour for the next 3 hours,
    and quadruples every hour thereafter.

    Args:
    initial_population (int): The initial population of the bacteria.
    hours (int): The total number of hours to simulate the growth.

    Returns:
    int: The population of bacteria after the specified number of hours.
    """
def simulate_bacterial_growth(initial_population: int, hours: int) -> int {
    if (hours <= 0) {
        return initial_population;
    }
    population = initial_population;
    for i in range(min(2, hours)) {
        population *= 2;
        hours -= 1;
    }
    for i in range(min(3, hours)) {
        population *= 3;
        hours -= 1;
    }
    for i in range(hours) {
        population *= 4;
    }
    return population;
}

