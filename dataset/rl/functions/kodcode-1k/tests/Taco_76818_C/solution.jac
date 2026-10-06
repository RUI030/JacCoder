"""
    This function takes a list of packet weights, a maximum weight W, and a reset cost,
    and returns the minimum cost to process all packets on the conveyor belt.
    """
def minimize_reset_cost(weights: list[int], W: int, resetCost: int) -> int {
    total_cost = 0;
    current_weight = 0;
    for weight in weights {
        if ((current_weight + weight) > W) {
            total_cost += resetCost;
            current_weight = 0;
        }
        current_weight += weight;
    }
    return total_cost;
}

