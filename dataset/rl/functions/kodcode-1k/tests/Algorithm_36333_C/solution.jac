import from heapq { heapify, heappop, heappush }
import from typing { List }
"""
    Calculate the minimum cost required to merge all the given shipments into a single shipment.
    """
def min_merge_cost(weights: list[int]) -> int {
    if (len(weights) <= 1) {
        return 0;
    }
    heapify(weights);
    total_cost = 0;
    while (len(weights) > 1) {
        first = heappop(weights);
        second = heappop(weights);
        cost = first + second;
        total_cost += cost;
        heappush(weights, cost);
    }
    return total_cost;
}

