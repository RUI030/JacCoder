"""
    Determines the minimum total time required to produce at least K units of each product.

    Parameters:
    N (int): Number of products
    M (int): Number of machines
    K (int): Units of each product required
    P (list): Time required to produce a single unit of each product

    Returns:
    int: The minimum total time required
    """
def min_total_time(N: int, M: int, K: int, P: list[int]) -> int {
    times = [(P[i] * K) for i in range(N)];
    times.sort(reverse=True);
    result = 0;
    for i in range(M) {
        if (i < len(times)) {
            result = max(result, times[i]);
        }
    }
    return result;
}

