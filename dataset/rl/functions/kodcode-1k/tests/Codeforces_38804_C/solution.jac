"""
    Determines the maximum number of pebbles Alice can collect without exceeding the weight limit.

    Parameters:
    n (int): Number of pebbles.
    W (int): Maximum weight Alice's backpack can carry.
    weights (list): List of weights of the pebbles.

    Returns:
    int: Maximum number of pebbles Alice can collect.
    """
def max_pebbles(n: int, W: int, weights: list[int]) -> int {
    weights.sort();
    current_weight = 0;
    count = 0;
    for weight in weights {
        if ((current_weight + weight) <= W) {
            current_weight += weight;
            count += 1;
        } else {
            break;
        }
    }
    return count;
}

