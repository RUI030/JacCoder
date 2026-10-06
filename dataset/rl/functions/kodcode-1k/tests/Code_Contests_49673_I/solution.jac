"""
    Calculate the maximum number of bicycles that can be assembled, and the remaining chains and tires.

    Args:
    n (int): Number of chains.
    m (int): Number of tires.

    Returns:
    tuple: A tuple containing the number of assembled bicycles, remaining chains, and remaining tires.
    """
def assemble_bicycles(n: int, m: int) -> tuple[int, int, int] {
    max_bicycles = min(n, (m // 2));
    remaining_chains = n - max_bicycles;
    remaining_tires = m - (max_bicycles * 2);
    return (max_bicycles, remaining_chains, remaining_tires);
}

