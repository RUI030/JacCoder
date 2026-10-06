import from main { min_trails }

test "case 0" {
    want = 2;
    got = min_trails(3, 8, 7, [(4, 5), (2, 4), (6, 3)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = min_trails(2, 10, 10, [(1, 1), (2, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_trails(2, 5, 3, [(5, 3), (3, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_trails(3, 10, 6, [(3, 2), (3, 2), (4, 2)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_trails(4, 7, 5, [(1, 1), (6, 4), (2, 2), (3, 4)]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
