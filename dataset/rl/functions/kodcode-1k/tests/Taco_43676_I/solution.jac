import from heapq { nlargest }
def max_total_magical_power(n: int, m: int, grid: list[list[int]]) -> int {
    if (not grid or not grid[0]) {
        return 0;
    }
    max_powers = [];
    for row in grid {
        max_powers.append(max(row));
    }
    sorted_max_powers = nlargest(n, max_powers);
    return sum(sorted_max_powers);
}

