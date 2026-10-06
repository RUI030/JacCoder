import from main { findPairs }

test "case 0" {
    want = [(-1, 7), (1, 5)];
    got = findPairs([1, 5, 7, -1, 5], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(2, 4), (3, 3)];
    got = findPairs([2, 3, 4, 3, 2], 6);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [];
    got = findPairs([1, 2, 3], 10);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 4), (2, 3)];
    got = findPairs([1, 2, 3, 4], 5);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 1)];
    got = findPairs([1, 1, 1, 1, 1], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [(-2, 3), (-1, 2), (0, 1)];
    got = findPairs([-1, 0, 1, 2, -2, 3], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [(3000, 5000)];
    got = findPairs([1000, 2000, 3000, 4000, 5000], 8000);
    assert got == want, f"expected={want!r} actual={got!r}";
}
