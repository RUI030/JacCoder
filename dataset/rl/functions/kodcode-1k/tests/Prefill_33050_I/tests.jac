import from main { total }

test "case 0" {
    want = 15;
    got = total([1, 2, 3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = 0;
    got = total([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = 4;
    got = total([1, 0, 3, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = -15;
    got = total([-1, -2, -3, -4, -5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = 2;
    got = total([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = 0;
    got = total([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
