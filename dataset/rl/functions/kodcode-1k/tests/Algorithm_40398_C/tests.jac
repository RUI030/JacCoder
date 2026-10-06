import from main { product_except_self }

test "case 0" {
    want = [24, 12, 8, 6];
    got = product_except_self([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0, 0, 9, 0, 0];
    got = product_except_self([-1, 1, 0, -3, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0, 3, 0];
    got = product_except_self([1, 0, 3]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 0, 0];
    got = product_except_self([0, 0, 0, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-24, -12, -8, -6];
    got = product_except_self([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [-60, 40, -30, -24];
    got = product_except_self([2, -3, 4, 5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [180, 600, 360, 300, 900];
    got = product_except_self([10, 3, 5, 6, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [4, 3];
    got = product_except_self([3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
