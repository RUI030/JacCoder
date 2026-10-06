"""
    Returns the minimum, maximum, and average number of packages delivered.

    Parameters:
    routes (list): A list of integers representing the number of packages per route.

    Returns:
    list: A list containing the minimum, maximum, and average number of packages delivered,
          rounded to two decimal places.
    """
def deliveryAnalysis(routes: list[int]) -> list[float] {
    minimum = min(routes);
    maximum = max(routes);
    average = round((sum(routes) / len(routes)), 2);
    return [minimum, maximum, average];
}

