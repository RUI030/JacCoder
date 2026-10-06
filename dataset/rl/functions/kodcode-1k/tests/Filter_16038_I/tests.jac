import from main { merge_intervals }

test "case 0" {
    want = [(1, 2), (3, 5), (6, 7)];
    got = merge_intervals([(1, 2), (3, 5), (6, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 4), (5, 6)];
    got = merge_intervals([(1, 2), (2, 4), (5, 6)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 4), (5, 8)];
    got = merge_intervals([(1, 3), (2, 4), (5, 7), (6, 8)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 10)];
    got = merge_intervals([(1, 10), (2, 3), (4, 5), (6, 7)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 5)];
    got = merge_intervals([(1, 5)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = merge_intervals([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(1, 5), (6, 8)];
    got = merge_intervals([(4, 5), (1, 3), (6, 8), (2, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
