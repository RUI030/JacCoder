import from typing { List, Tuple }
def find_missing_ranges(arr: list[int], lo: int, hi: int) -> list[tuple[int, int]] {
    if not arr {
        return [(lo, hi)];
    }
    result = [];
    prev = lo - 1;
    for num in arr {
        if (num == (prev + 2)) {
            result.append(((prev + 1), (prev + 1)));
        } elif (num > (prev + 2)) {
            result.append(((prev + 1), (num - 1)));
        }
        prev = num;
    }
    if (prev < hi) {
        result.append(((prev + 1), hi));
    }
    return result;
}

