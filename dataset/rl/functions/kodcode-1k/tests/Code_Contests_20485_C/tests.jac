import from main { min_rest_days }

test "case 0" {
    want = 1;
    got = min_rest_days(5, [0, 1, 3, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 2;
    got = min_rest_days(4, [3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_rest_days(3, [1, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_rest_days(3, [0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 0;
    got = min_rest_days(4, [1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 2;
    got = min_rest_days(4, [1, 0, 1, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 2;
    got = min_rest_days(4, [2, 0, 2, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 2;
    got = min_rest_days(5, [3, 3, 3, 3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 2;
    got = min_rest_days(6, [0, 1, 3, 0, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
