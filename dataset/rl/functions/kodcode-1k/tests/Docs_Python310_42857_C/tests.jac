import from main { find_largest }

test "case 0" {
    want = 9;
    got = find_largest([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -10;
    got = find_largest([-10, -20, -30, -40, -50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 42;
    got = find_largest([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = find_largest([5, 5, 5, 5, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 9;
    got = find_largest([-3, 4, 1, -5, 0, 9, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
