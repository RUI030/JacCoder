import from main { find_missing_ranges }

test "case 0" {
    want = [(1, 2), (4, 4), (6, 10)];
    got = find_missing_ranges([3, 5], 1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(4, 6), (10, 10)];
    got = find_missing_ranges([1, 2, 3, 7, 8, 9], 1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(2, 6)];
    got = find_missing_ranges([], 2, 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = find_missing_ranges([1, 2, 3, 4, 5], 1, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = find_missing_ranges([2, 3, 4, 5], 2, 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [(1, 1)];
    got = find_missing_ranges([], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(1, 100)];
    got = find_missing_ranges([], 1, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [(1, 49), (51, 100)];
    got = find_missing_ranges([50], 1, 100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [];
    got = find_missing_ranges([1], 1, 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 9" {
    want = [(2, 9)];
    got = find_missing_ranges([1, 10], 1, 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 10" {
    want = [];
    got = find_missing_ranges([1, 2, 3, 4, 5, 6, 7], 1, 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}
