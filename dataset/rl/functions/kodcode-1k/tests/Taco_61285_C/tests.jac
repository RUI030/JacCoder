import from main { smallest_missing_positive_integer }

test "case 0" {
    want = [1];
    got = smallest_missing_positive_integer(1, [(5, [2, 3, 7, 6, 8])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = smallest_missing_positive_integer(1, [(4, [-1, -3, 4, 2])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [4];
    got = smallest_missing_positive_integer(1, [(3, [1, 2, 3])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [1, 1, 4];
    got = smallest_missing_positive_integer(3, [(5, [2, 3, 7, 6, 8]), (4, [-1, -3, 4, 2]), (3, [1, 2, 3])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [1];
    got = smallest_missing_positive_integer(1, [(0, [])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [1];
    got = smallest_missing_positive_integer(1, [(5, [-1, -2, -3, -4, -5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [6];
    got = smallest_missing_positive_integer(1, [(5, [1, 2, 3, 4, 5])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [4];
    got = smallest_missing_positive_integer(1, [(6, [1, 2, 3, 5, 6, 7])]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
