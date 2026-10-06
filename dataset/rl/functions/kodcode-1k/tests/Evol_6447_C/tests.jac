import from main { product_excluding_self }

test "case 0" {
    want = [24, 12, 8, 6];
    got = product_excluding_self([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [1];
    got = product_excluding_self([5]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [2, 10];
    got = product_excluding_self([10, 2]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [0, 0, 8, 0];
    got = product_excluding_self([1, 2, 0, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [-24, -12, -8, -6];
    got = product_excluding_self([-1, -2, -3, -4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [];
    got = product_excluding_self([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
