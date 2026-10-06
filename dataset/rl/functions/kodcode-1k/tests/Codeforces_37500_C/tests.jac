import from main { min_repairs }

test "case 0" {
    want = 1;
    got = min_repairs(3, 5, [4, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = min_repairs(1, 5, [4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 0;
    got = min_repairs(4, 5, [1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 3;
    got = min_repairs(2, 5, [10, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = min_repairs(5, 10, [2, 3, 5, 7, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 4;
    got = min_repairs(5, 1, [1, 1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
