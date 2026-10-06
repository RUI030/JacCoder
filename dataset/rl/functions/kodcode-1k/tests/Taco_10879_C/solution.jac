def two_sum(arr: list[int], target: int) -> list[int] {
    seen = {};
    for (i, num) in enumerate(arr) {
        complement = target - num;
        if (complement in seen) {
            return [seen[complement], i];
        }
        seen[num] = i;
    }
    return [];
}

