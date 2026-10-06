import from itertools { combinations }
"""
    Calculate the minimum number of trails a team needs to complete
    to meet the required difficulty points and checkpoints.

    If it's not possible, return -1.
    """
def min_trails(t: int, d: int, c: int, trails: list[tuple[int, int]]) -> int {
    for i in range(1, (t + 1)) {
        for comb in combinations(trails, i) {
            sum_difficulty = sum(trail[0] for trail in comb);
            sum_checkpoints = sum(trail[1] for trail in comb);
            if ((sum_difficulty >= d) and (sum_checkpoints >= c)) {
                return i;
            }
        }
    }
    return -1;
}

