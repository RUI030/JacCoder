"""
    Rearranges the array such that consecutive differences are at least k if possible.
    """
def rearrange_possible(n: int, k: int, a: list[int]) -> str {
    a.sort();
    rearranged = [];
    (i, j) = (0, (n - 1));
    while (i <= j) {
        if ((len(rearranged) % 2) == 0) {
            rearranged.append(a[i]);
            i += 1;
        } else {
            rearranged.append(a[j]);
            j -= 1;
        }
    }
    for i in range(1, len(rearranged)) {
        if (abs((rearranged[i] - rearranged[(i - 1)])) < k) {
            return "No";
        }
    }
    return ("Yes\n" + " ".join(map(str, rearranged)));
}

