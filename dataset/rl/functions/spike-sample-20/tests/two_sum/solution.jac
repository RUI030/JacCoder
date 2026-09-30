def two_sum(nums: list[int], target: int) -> list[int] {
    seen: dict[int, int] = {};
    for (j, n) in enumerate(nums) {
        if (target - n) in seen {
            return [seen[target - n], j];
        }
        if n not in seen {
            seen[n] = j;
        }
    }
    return [];
}
