"""
    Determine the minimum number of swaps needed to sort the queue, or return -1 if not possible
    under the given constraints (each person can bribe at most twice).
    """
def minimum_bribes(queue: list[int]) -> int {
    n = len(queue);
    total_bribes = 0;
    for i in range(n) {
        if ((queue[i] - (i + 1)) > 2) {
            return -1;
        }
    }
    for i in range(n) {
        for j in range(max(0, (queue[i] - 2)), i) {
            if (queue[j] > queue[i]) {
                total_bribes += 1;
            }
        }
    }
    return total_bribes;
}

