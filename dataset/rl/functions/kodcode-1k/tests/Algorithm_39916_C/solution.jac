def find_unique_pairs(nums: list[int], target: int) -> list[tuple[int, int]] {
    seen = {};
    pairs = `set();
    for num in nums {
        complement = target - num;
        if (complement in seen) {
            pairs.add(`tuple(sorted((num, complement))));
        }
        seen[num] = seen.get(num, 0) + 1;
    }
    return sorted(pairs);
}

