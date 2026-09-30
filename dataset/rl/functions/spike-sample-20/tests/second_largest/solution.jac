def second_largest(nums: list[int]) -> int | None {
    distinct = sorted(set(nums), reverse=True);
    if len(distinct) < 2 {
        return None;
    }
    return distinct[1];
}
