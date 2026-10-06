"""
    Calculates the influence scores for each user.

    Parameters:
    N (int): Number of users.
    M (int): Number of mutual connections.
    connections (list of tuples): Each tuple contains two integers representing a mutual connection.

    Returns:
    list: A list of N integers representing the influence scores of each user.
    """
def calculate_influence_scores(N: int, M: int, connections: list[tuple[int, int]]) -> list[int] {
    import from collections { defaultdict }
    influence_scores = [0] * N;
    graph = defaultdict(`set);
    for (u, v) in connections {
        graph[(u - 1)].add((v - 1));
        graph[(v - 1)].add((u - 1));
    }
    for i in range(N) {
        influence_scores[i] = len(graph[i]);
    }
    return influence_scores;
}

