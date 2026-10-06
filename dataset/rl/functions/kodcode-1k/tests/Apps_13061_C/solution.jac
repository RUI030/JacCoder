"""
    Given a sorted list of integers, return a list of ranges in the form of strings "a->b" for
    consecutive sequences or just "a" if there is no sequence.
    """
def getRanges(arr: list[int]) -> list[str] {
    if not arr {
        return [];
    }
    ranges = [];
    start = arr[0];
    end = arr[0];
    for num in arr[1:] {
        if (num == (end + 1)) {
            end = num;
        } else {
            if (start == end) {
                ranges.append(f"{start}");
            } else {
                ranges.append(f"{start}->{end}");
            }
            start = num;
            end = num;
        }
    }
    if (start == end) {
        ranges.append(f"{start}");
    } else {
        ranges.append(f"{start}->{end}");
    }
    return ranges;
}

