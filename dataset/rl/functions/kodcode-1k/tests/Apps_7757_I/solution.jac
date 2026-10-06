"""
    Given a list of daily temperatures, calculates the number of days until a warmer
    temperature for each day.

    Args:
    N: int - Number of days.
    temperatures: List[int] - List of daily temperatures.

    Returns:
    List[int] - List of days until a warmer temperature.
    """
def daily_temperatures(N: int, temperatures: list[int]) -> list[int] {
    result = [0] * N;
    stack = [];
    for i in range(N) {
        while (stack and (temperatures[i] > temperatures[stack[-1]])) {
            prev_index = stack.pop();
            result[prev_index] = i - prev_index;
        }
        stack.append(i);
    }
    return result;
}

