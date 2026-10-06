import from main { single_number }

test "case 0" {
    want = 1;
    got = single_number([2, 2, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 4;
    got = single_number([4, 1, 2, 1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 10;
    got = single_number([7, 7, 8, 8, 9, 9, 10]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 1;
    got = single_number([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 1;
    got = single_number([100000000, 2, 2, 100000000, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
