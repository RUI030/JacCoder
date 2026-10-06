"""
    Shuffle the array such that elements at even indices are greater than their preceding odd indices
    while maintaining the relative order of elements otherwise.
    """
def shuffleArray(arr: list[int]) -> list[int] {
    if (not arr or (len(arr) < 2)) {
        return arr;
    }
    evens = [arr[i] for i in range(1, len(arr), 2)];
    odds = [arr[i] for i in range(0, len(arr), 2)];
    result = [];
    even_idx = 0;
    odd_idx = 0;
    for i in range(len(arr)) {
        if ((i % 2) == 0) {
            result.append(odds[odd_idx]);
            odd_idx += 1;
        } else {
            result.append(evens[even_idx]);
            even_idx += 1;
        }
    }
    return result;
}

