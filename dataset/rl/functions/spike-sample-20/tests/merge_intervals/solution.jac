def merge_intervals(intervals: list[list[int]]) -> list[list[int]] {
    merged: list[list[int]] = [];
    for iv in sorted(intervals) {
        if merged and iv[0] <= merged[-1][1] {
            merged[-1][1] = max(merged[-1][1], iv[1]);
        } else {
            merged.append([iv[0], iv[1]]);
        }
    }
    return merged;
}
