import from main { findPairs }

test "case 0" {
    want = [(2, 4), (3, 3)];
    got = findPairs([1, 2, 3, 4, 3], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [];
    got = findPairs([1, 2, 3], 7);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 3), (2, 2)];
    got = findPairs([1, 1, 2, 2, 3, 3], 4);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(-3, 3), (-2, 2), (-1, 1)];
    got = findPairs([-1, -2, -3, 1, 2, 3], 0);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [];
    got = findPairs([], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = findPairs([5], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(5, 6)];
    got = findPairs([1, 2, 3, 4, 5, 6], 11);
    assert got == want, f"expected={want!r} actual={got!r}";
}
