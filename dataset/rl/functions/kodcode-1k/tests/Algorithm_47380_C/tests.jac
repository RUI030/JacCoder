import from main { single_number }

test "case 0" {
    want = 3;
    got = single_number([2, 2, 3, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 99;
    got = single_number([0, 1, 0, 1, 0, 1, 99]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 1;
    got = single_number([-2, -2, 1, -2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 500;
    got = single_number([30000, 500, 100, 30000, 100, 30000, 100]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 3;
    got = single_number([1, 1, 1, 2, 2, 2, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 7;
    got = single_number([5, 4, 4, 4, 5, 5, 6, 6, 6, 7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = 100000;
    got = single_number([-1, -1, -1, 100000]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = 15;
    got = single_number([10, 10, 10, -10, -10, -10, 15]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = 12;
    got = single_number([12]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
