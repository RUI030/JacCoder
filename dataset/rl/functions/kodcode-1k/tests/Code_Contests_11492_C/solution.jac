def count_ways(M: int, L: int) -> int {
    import from itertools { combinations }
    candies = range(1, (M + 1));
    return len(`list(combinations(candies, L)));
}

