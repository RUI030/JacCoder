import from main { merge_intervals }

test "empty" {
    want = [];
    got = merge_intervals([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "unsorted input" {
    want = [[1, 4], [8, 9]];
    got = merge_intervals([[8, 9], [1, 4], [2, 3]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "touching merge" {
    want = [[1, 3]];
    got = merge_intervals([[1, 2], [2, 3]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "contained" {
    want = [[1, 10]];
    got = merge_intervals([[1, 10], [2, 3], [4, 5]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "disjoint" {
    want = [[1, 2], [5, 6]];
    got = merge_intervals([[5, 6], [1, 2]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "chain" {
    want = [[1, 9]];
    got = merge_intervals([[1, 3], [6, 9], [2, 7]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
