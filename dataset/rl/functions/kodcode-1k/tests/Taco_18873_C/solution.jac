"""
    Returns the minimum number of retrieval actions required to fulfill all orders.
    """
def min_retrieval_actions(m: int, quantities: list[int], sizes: list[str]) -> int {
    import from collections { Counter }
    size_counts = Counter(sizes);
    return len(size_counts);
}

