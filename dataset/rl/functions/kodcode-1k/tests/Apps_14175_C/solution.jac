"""
    Given a list of daily temperatures, return a list of how many days you would have to wait until
    a warmer temperature. If there is no such day, put 0.
    """
def daily_temperatures(temps: list[int]) -> list[int] {
    n = len(temps);
    result = [0] * n;
    stack = [];
    for i in range(n) {
        while (stack and (temps[i] > temps[stack[-1]])) {
            idx = stack.pop();
            result[idx] = i - idx;
        }
        stack.append(i);
    }
    return result;
}

