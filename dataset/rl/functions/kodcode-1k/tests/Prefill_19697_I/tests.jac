import from main { rectangle_dimensions }

test "case 0" {
    want = [(1, 24), (2, 12), (3, 8), (4, 6)];
    got = rectangle_dimensions(24);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [(1, 1)];
    got = rectangle_dimensions(1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [(1, 36), (2, 18), (3, 12), (4, 9), (6, 6)];
    got = rectangle_dimensions(36);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [(1, 100), (2, 50), (4, 25), (5, 20), (10, 10)];
    got = rectangle_dimensions(100);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [(1, 17)];
    got = rectangle_dimensions(17);
    assert got == want, f"expected={want!r} actual={got!r}";
}
