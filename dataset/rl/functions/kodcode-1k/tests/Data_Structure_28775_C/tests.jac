import from main { find_missing_ranges }

test "case 0" {
    want = [(1, 2), (4, 4), (6, 10)];
    got = find_missing_ranges([3, 5], 1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(3, 3), (7, 9)];
    got = find_missing_ranges([1, 2, 4, 5, 6, 10], 1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(5, 5)];
    got = find_missing_ranges([], 5, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = find_missing_ranges([1, 2, 3, 4, 5], 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 5)];
    got = find_missing_ranges([], 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [(0, 0), (2, 2), (4, 6), (10, 10)];
    got = find_missing_ranges([1, 3, 7, 8, 9], 0, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(5, 6)];
    got = find_missing_ranges([2, 3, 4, 7, 8], 5, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [(0, 9), (11, 100)];
    got = find_missing_ranges([10], 0, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}
