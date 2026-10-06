import from main { min_streetlights }

test "case 0" {
    want = 3;
    got = min_streetlights(5, 10, [1, 5, 8, 9, 12], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = -1;
    got = min_streetlights(5, 10, [15, 16, 17, 18, 19], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = min_streetlights(1, 2, [1], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_streetlights(5, 15, [2, 7, 8, 12, 5], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = min_streetlights(3, 6, [0, 3, 6], 2);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = min_streetlights(6, 10, [2, 4, 6, 8, 10, 12], 3);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 1;
    got = min_streetlights(1, 1000000, [500000], 1000000);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 1;
    got = min_streetlights(1, 1, [0], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 1;
    got = min_streetlights(2, 2, [1, 2], 1);
    assert got == want, f"expected={want!r} actual={got!r}";
}
