"""
    Takes a vector of integers that contains several blocks of sequential integers and returns a vector of strings where
    each string represents a collapsed version of the sequential integers in the input vector.
    """
def collapse_intervals(lst: list[int]) -> list[str] {
    if not lst {
        return [];
    }
    result = [];
    start = lst[0];
    for i in range(1, len(lst)) {
        if (lst[i] != (lst[(i - 1)] + 1)) {
            if (start != lst[(i - 1)]) {
                result.append(f"{start}->{lst[(i - 1)]}");
            } else {
                result.append(f"{start}");
            }
            start = lst[i];
        }
    }
    if (start != lst[-1]) {
        result.append(f"{start}->{lst[-1]}");
    } else {
        result.append(f"{start}");
    }
    return result;
}

