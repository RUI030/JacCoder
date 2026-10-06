import from main { difference_between_extremes }

test "case 0" {
    want = 7;
    got = difference_between_extremes([10, 3, 5, 6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = difference_between_extremes([7, 7, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = difference_between_extremes([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 0;
    got = difference_between_extremes([42]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 7;
    got = difference_between_extremes([-10, -3, -5, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 30;
    got = difference_between_extremes([-10, 20, 5, -6]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
