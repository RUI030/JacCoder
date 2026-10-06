import from main { merge_intervals }

test "case 0" {
    want = [[1, 6], [8, 10], [15, 18]];
    got = merge_intervals([[1, 3], [2, 6], [8, 10], [15, 18]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [[1, 5]];
    got = merge_intervals([[1, 4], [4, 5]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [[1, 2], [3, 4]];
    got = merge_intervals([[1, 2], [3, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [[1, 5]];
    got = merge_intervals([[1, 4], [2, 3], [3, 5]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [[1, 6], [7, 8]];
    got = merge_intervals([[1, 4], [5, 6], [7, 8], [2, 5]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [[1, 4]];
    got = merge_intervals([[1, 4]]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [];
    got = merge_intervals([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
