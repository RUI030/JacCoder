import from main { max_distance }

test "case 0" {
    want = 42;
    got = max_distance(5, [10, 5, 7, 8, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 42;
    got = max_distance(5, [10, -5, 7, -8, 12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 42;
    got = max_distance(5, [-10, -5, -7, -8, -12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1000;
    got = max_distance(1, [1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1000;
    got = max_distance(1, [-1000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = max_distance(5, [0, 0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 37;
    got = max_distance(6, [7, -6, 2, -9, 10, -3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
