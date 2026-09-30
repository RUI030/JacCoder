def compress_ranges(nums: list[int]) -> str {
    if not nums {
        return "";
    }
    parts: list[str] = [];
    start = nums[0];
    prev = nums[0];
    for n in nums[1:] + [None] {
        if n is not None and n == prev + 1 {
            prev = n;
            continue;
        }
        parts.append(str(start) if start == prev else f"{start}-{prev}");
        if n is not None {
            start = n;
            prev = n;
        }
    }
    return ",".join(parts);
}
