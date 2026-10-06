# minimize_reset_cost

This function takes a list of packet weights, a maximum weight W, and a reset cost,
and returns the minimum cost to process all packets on the conveyor belt.

Args:
weights (List[int]): The weights of the packets.
W (int): The maximum weight the conveyor belt can handle.
resetCost (int): The cost to reset the conveyor belt.

Returns:
int: The minimum cost to process all packets on the conveyor belt.

Examples:
>>> minimize_reset_cost([2, 4, 3, 5], 10, 7)
7
>>> minimize_reset_cost([1, 1, 1, 1, 1], 2, 3)
6

Implement `minimize_reset_cost(weights: list[int], W: int, resetCost: int) -> int`.
