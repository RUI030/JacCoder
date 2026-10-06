import from main { product_except_self }

test "case 0" {
    want = [24, 12, 8, 6];
    got = product_except_self([1, 2, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 1" {
    want = [0];
    got = product_except_self([1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 2" {
    want = [0];
    got = product_except_self([7]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 3" {
    want = [];
    got = product_except_self([]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 4" {
    want = [0, 12, 0, 0];
    got = product_except_self([1, 0, 3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 5" {
    want = [0, 0, 0, 0];
    got = product_except_self([0, 2, 3, 0]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 6" {
    want = [1, 1, 1, 1];
    got = product_except_self([1, 1, 1, 1]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 7" {
    want = [-24, 12, -8, 6];
    got = product_except_self([-1, 2, -3, 4]);
    assert got == want, f"expected={want!r} actual={got!r}";
}

test "case 8" {
    want = [1200000, 600000, 400000, 300000, 240000];
    got = product_except_self([10, 20, 30, 40, 50]);
    assert got == want, f"expected={want!r} actual={got!r}";
}
