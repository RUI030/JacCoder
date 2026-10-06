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
    want = 1;
    got = single_number([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = 5;
    got = single_number([4, 1, 2, 1, 2, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 4;
    got = single_number([4, -1, 2, -1, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = single_number([0, 1, 1, 2, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
